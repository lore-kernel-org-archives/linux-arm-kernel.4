Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AE8606EE99
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z13YW2TQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=n0/To9fJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhhF39Wt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=; b=Z13YW2TQeUw6+p
	1VfrdkqWb/ujUPLqs4hYGFd0Ofh2qVHxcfoUDBIoBkIXtHa45OOWX8v+++u7D4D5ZSn0FUS52y4Fm
	FFEuakctDP0DyO8YG8c2m+TEBak/M4cEsPvzUjlolI0EmUVpZaBmLih/8Pl9oC6eI3iVUUBhny3+t
	emGtQ7whruVuIBPvDgQD8zH9qY8/otpBd5gn/x0Ww/Oe7aXTNyvdamdKX7ez5eiiPqTVsZXiPjF9U
	J4cx/EwwBp7tzU4/L/RLS/+878+rOgqsHD6p/hDOpIw+nqU7B3gxJuM5CFakxl0srzwzL1t7lik1i
	3ZQw4TTvUZcGY+P161Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRK-0000000F0Sk-19v6;
	Sat, 07 Nov 2026 16:38:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRI-0000000F0Ra-3i01
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 07 Nov 2026 16:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=; b=n0/To9fJWFHWrb6iIlDA4u11fj
	0wBIpPutgbuK5XmNFv5RCRM8ZE2K2N3eQrktVJN7+uhgrW8iZ15wRQmmZQzrS51j5esjBcvcGG8wE
	RvQxsZulSwG/CVrIRIqsxRKdVMVoNRkMwApSIyzZZ61h/KNTkiYif2IXbH/UzwUkIC7ostLDh0INW
	odXRJ7/llmbdsh0axN6IlgnO2Ff1usBWmTdjEnK26ik1oMj1r9WIF28eE5/F6P9d2G7OJU6BDDyg9
	mTbwhUW+m8DAz91QpSLFwosle12JHWzIbh/o1Xib3tCqzDAZlwYcoZZdn+THNd89EWqM7oW5qipIS
	5ptmt2Hg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRF-00000005KE2-2wwb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:38:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so13819115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069524; x=1794674324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=;
        b=UhhF39WtAS+L/NNHaNcCNvlybzhCLEbcWoWdvoC3p85x3AfIBQh2bEnZCVbuhf4owF
         AWrRJHW64BEwKNIsrEEZUYjoePDvzkr2CyZZpvi/h6P5PSdbx9I1FV3UkJkoR0Temoi4
         QEKQm+i5bbbYStC7wwtunenGpof8cgCiTAVvT7wqrb6E1eUFl4bhrUg8GNQ9VotoF3jW
         VItONE+7x2g9RtHLCM5fNe7/9dgy+jAnSybixfulahg50PouQ+Wl44UGvrCr8KayaB3Z
         8YTtTcVxZ/5+98huKf3StMWoI9A3TGlH2dFELfCXBvJIfL+AwAR+MTrRvOf+xW29Ey4R
         AV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069524; x=1794674324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=;
        b=gzWtR13GEi03WXMd1NjcriTTGOjiytXOXw/ZjYWg+PjEwPT1GRaOYVjmkVJzY+JbWt
         4O+a3wJEKHCA4mZwQLI8sXx43y50iAVPqO9ZKxzRrR1hlFADXVPUP8wcuL6QlCBxqd8/
         C/VqzFOQz0J6nK3BBBOfPf4706W9cvl7UlHHDWq7jP+eMoWLQZFO5L79t0FWHZQXGnH6
         BCfOKaYHzuNruv527zn3mwSk1slIvGOFh1HCiIEO8N4Vuobqt1zQLuvZj9mfsyxDfryk
         QiN51klouxfL2a6L4OZ2UNVGiQWWYL/mKDZZa+jskXGe1PohPuwzT7MQUdD2rxPXxBpj
         AVGw==
X-Forwarded-Encrypted: i=1; AKwUvByvY0OIJdtGElSRVj+NmZ8dIguHopmcz39kDvZ9BIz4SdsDc5e5e++5wZl8AiAfgL5NFGu6WzZ9w81I5/0ngdnA@lists.infradead.org
X-Gm-Message-State: APuU4Z+L3spNsH4zb+Uv2/FJaREdlxiCWbXNYhpwMH8JDi1jC734Fimk
	UfcCIqSJtXmS2X21mGXxR5TWvmtCnD3GI1KHtrmfysQj8rRrd0YQvUn1
X-Gm-Gg: AYBFou1aG/ooq0IGcPxfvDVd0Q7nFUEeUKjqn2rYlIv6X8uvc4R/qHRErVEOt04VRL7
	eTh3nfC/kz4nEEiLfpxk1Q4G2o41aPYbz7EAuMqpJI4kl5UbnzvZ1iZ2pGgtBRrDkhngMnoXkTD
	UtNBQNrlZ9ZSSaSL3IKUo9HiP5l8so8aEv71IDSVFw7Q3UqKseD8R9WFp8zTSFOzARm2Z2XSWmd
	HFjE/fXmT46Gq5lQUyPmAaUErxmRNeXGnYYjS/Ewjvv3eDytW9H6FL6GFLDRlP5yV9lTl4pk4XV
	A+vAciLw/keqcioSX0w+p8hVikbGZqnS0gQQAJWLvhxk8nB+npLynFtqhSr+IwnfiMcWnJ+WaTP
	CZ/2PoLBKHLaTV2SD9cDsRu/pTcxnWaYokU6rdDNmSPOIvhoUA7D76dNpQoXnmcQxL1j/ihZPhz
	WbRSrh+PQh4vnY5y9WAmDafkSdes+dpUEiDP6t4dognIGvsXNPlSQKa/yfi0FJxfsiAovRYMGgx
	unvL7V/z6Lg0cgAdG/7876Iz1aXJrohnD/WumJaBAfvwSwp803tsu2my5KuEmNzJIiN7LqsYE3e
	OUkBp6i/8xxKU9vXDHaggckOGs6D8a1vVZKaEbTKz1wI3bnaag1TZL01oKUiO5wmcNtoL+roZnF
	iHsfSiaFybgfvmRA=
X-Received: by 2002:a05:600c:3b02:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4b6ded49a38mr111142035e9.28.1794069523638;
        Sat, 07 Nov 2026 08:38:43 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:43 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:05 +0100
Subject: [PATCH 1/6] firmware: raspberrypi: Add blank line after
 declaration in response_callback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v1-1-707362c710cd@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=641;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=oT/JQjeja8ZJ/ptNbh5as5O7phAoJf3oIOYYqQOmlq0=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRSwl3dPT7z3GewKlQZwX836+udoUYb1MYG
 2lOV+cpxsyJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 ZyizD/4tgdMiaKw7eo815OU4Bg94SHIg6on//lvweQFfXg/MAaDe8Q4h7IKQSUuKIlIWK8xeQZj
 RjAd/lvLrxfNNP6eDPbYjfmX9UNmxlApdkpM8aqog/QYAOyCCQedgj04EJTvTCX1XL/Nb4vC7NU
 cRxhZVTqqKogGrre5jJNCe1xmeqeZnpNcNNsvXhik4RasxxaYzXPGCzAK06Bdwod+QkyIIbOOhh
 fxlBCScPNPu/X+S3bHgBZ0qKXeNTvhvWjcK3vmdLBjNF4De8zAdDuztRFt0jWGXFnpb/HMStAC0
 CvO5bQxqsrP+qLBHKCa4ZgB7n3Rou9QM+njTsB8Wqi0iArxW9ZXZwRnL210r7M2FEorUvWutKHe
 aklv2Ix0+jNKSiY3A0tx3liZzvhzv0cH6zHtrAjC2MzEM4VAT+v6z/5X+Cf66Ut0VS+ccq4HDr6
 n/P0dH4utW4m7uWd0iTQDuEBzz9Ove4XBSh2DP2nNb+wNE5kOyLQBqPit7BK6Wck5RJzBDNPWr1
 nxXTOnqbWXgEwvDpHKYMn8sHKUDILwUsxbqn1pp7qUwg6+gBLsQQBYm5UON49xEG431NrWJtLAs
 AU9y9KBPrVEwcQ9ywSH3lEslFs5JTXzhM3yx1sxK3a1eRGWeCujJ76tQ/DW8vRstH22Ak/W4obH
 vjwNne2SbDgMDoA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_163845_698314_5ACB1699 
X-CRM114-Status: GOOD (  10.68  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a blank line after the local variable declaration.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 443459c8c90f..8f3653c4a669 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -40,6 +40,7 @@ static DEFINE_MUTEX(transaction_lock);
 static void response_callback(struct mbox_client *cl, void *msg)
 {
 	struct rpi_firmware *fw = container_of(cl, struct rpi_firmware, cl);
+
 	complete(&fw->c);
 }
 

-- 
2.56.0


