Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE012606D80B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZsEj4hcG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=d7ByXyvU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0OpUd5f7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=; b=ZsEj4hcGlzz5Z+
	Q9BTZARhqkawVm8pNsqck1La9cpisBcNxvki20yZk1yDmvqSeajVsvsv5SVbFxwEhu2/t8mFKI3mF
	nuMHrANitnFdN0yANj72rv+ZVP7gjP8FPEIA060DJ4ncruDr6O7WNFsYOVKApVLnyPlZKBPYHFtLr
	nhgggm4LjJugQoz4jlrOAYJy55q0NlsYUwfvL3Vtk0mIr0MtjWGmaQ44zYkzodhgP3Xo7bExBcO2/
	Apfkix8da+OqtIPS8SACW5QZRi8JCbsrqcELewrHMJ9MvkkSqd4jTEn5HM2jiIdElqYCaN0J6E8Gl
	ezFHx8YWfMkI9uYztSqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRQ-0000000F0WX-2rlY;
	Sat, 07 Nov 2026 16:38:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRJ-0000000F0S6-3X2v
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 07 Nov 2026 16:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=; b=d7ByXyvUuez9xzCmX+X3/G/tos
	GVLFEzPsJoh1J/qt4qzh2oTZgMYYdSuMvRk1JA8FquQ8o9h8aj4StnwA30tFMO/Jm1l0vY/G4yb4b
	Kq0VeufxKYp+jsQZZLbROrJb9yk6jUfiJbTN9FKQhMhSoYDRoO9iu1dJ6QBRFlQ3RoFRoeTp6+t5H
	LXc0Gzz1rentGvWPQBswSBFXE7KX2mFRQq1QKGn4pZdFIFBb/jFQfDoqc2Nud2a9bGvbCbJDD5Bp7
	1921stdVnMv6WaDmLOOyPScil2scpJFo/x6ssnSK7nDtsw7S4c95GW3Rlfi/kklU9lj8CQsgaE0gB
	wWv+u34g==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRG-00000005KEQ-23Hy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:38:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so13819295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069525; x=1794674325; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=;
        b=0OpUd5f7AcbQhIXI/HYF0oNI6sAXET8DUT+AQ3yt1uLZKZl1IH3P8Ux+KWfMa27NxJ
         D8vFFcQV4T2AlEGE5kCm0z5g2dPG3tYRBy8YlFc47GjFAXXA14tF0YlTb2CHSQyuAVC3
         k9cWXi8pSOxvbs+ZHnU2YNO3oUwrBMJ2a5w++QL/iC1cjbdjiDmW2JX4s+RSIou8W0oC
         mlm7rf8lZ/b7HW+61m49Nzey5cRMsPD0ATq0HOJ2IkqhGBsVQGHXtVt5ZnkmhJCNPytw
         OgZE+XsI4QDSIz6T06xk7TUdQ//2rScbEuVdbvEb8Qh1RUijN8urXUK4aKEryp8O3Jsv
         i29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069525; x=1794674325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=;
        b=LjsBRiWAN/r5BEE+ztuc/sfCOpDJLucW0Me3Dito+mVfNahYH9NMs50pA/WgSs755H
         IY+qKl6uGky9kIa3Ci847MhkvPo5GGaGd40/eMO4/ysOkMA0BkLyiEa5FBubT2AUKglE
         4FEd9ABz8OAB3NJZgw5x6F2Gxgz3ctcIYpbXoiN4rCPGCQcQkABel85ThYzUKhspDQe5
         llC7dlRgk3cRqPGshqpGPlyw+Jm/5258c4Mh7KATfJJEttWW+dkkmW0Hu7dICvhWPHDl
         bpqNDgyetmEPQHSwQNv7/jR1gGsn721vKPT0DGAWT8sd7JGt1L9eCG5Zf9sIZnyRRGi4
         8k4w==
X-Forwarded-Encrypted: i=1; AKwUvBx7bJMsWxxhI5UKnwm45ql3vMZEjpBeBXU3x0PTWfJiyFdT/5hHv3PkwBkYsxGBEALglZHJOIBQ+sBYrm8AItx/@lists.infradead.org
X-Gm-Message-State: APuU4Z+myEP1zlNgtdG7nxy8WxFw80+IiNGtXezpNOWSxkPDSDXh3Ylc
	NlCzf6niMm5rqmuiwsleRSbutNaSeyAthIINTCYFSLU+bMzBbPyN2mdU
X-Gm-Gg: AYBFou1JjfDuE/1CFuMfnV9GX7g1xm5cYQNSS1NcUPU2mVY6QnEfBnLPgs2XovwEF3o
	3iTkupPkbEAvgNItYThbfzl1e4mOlnUi2xJBhb6I9zMeYT8R229ZBaiFsgNlL6koasHOyxciNUx
	DlXPbsEjTby68VIdaq99inHa7fHgk8zfW1AblNrVOE4vzTWUHVgZg0tRUrOta+LDwwJVdW1bDQm
	7MpGy11XPrTnEPx4jOrz40TuJU1/jfDi/khAvQlWLcrisEv6KNuyoAKj0tqh/aQ8XxKL5Yd2GyD
	7ZjJg3YLYfMd+2k3rPLl3a6g7eanwh4nwlj8LBZcrTCXayxYIzSPCieNC+x5AH4QUE5fcI1r/OZ
	7TM9CnwdZrbs/Oo86RFuNpFKE4ub0GugY858BT+FccbmkHE4bP8E1jHXEU/lb2VBHp65TCV9KDO
	p8xGLLaGxAW3+dGcUPuJek4Tds/AvrU53v4i90eXQhShi4qsAUp4cFtoHHUdAri0FhLHe5vBYfH
	aChQYlZ8YlYL3fvgU7yjbWuigxG3CfmM53t1R7cvBestwItdz4Eye+/Yxy6FvwHBazYsz7QNksi
	0L2s5u858QWNq1G3ytETxsxRDQWn/66KkVslKnf+qnZRzC/b0ip3eDQhmIYN7l8qQVc1/zV1tgy
	f7Z7uHK2UdxOc/fYMKUd6lglIxvK4cEdhpRKv
X-Received: by 2002:a05:600c:4e43:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4b6de0cda6cmr103703775e9.18.1794069525041;
        Sat, 07 Nov 2026 08:38:45 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:44 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:07 +0100
Subject: [PATCH 3/6] firmware: raspberrypi: Add blank line after
 declaration in probe error path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v1-3-707362c710cd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=704;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=S629c7Z4Xh+sglZqK1vBTNUvrddrb3hrJoBprGdVlMI=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRRKvmUqipMs3O8VSLIOMCtBnbhE0QXH81e
 C4C8oRlDxqJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 Z7AwD/9pd7aiIrAynLcKb9FZZcrsV2F1QUrisJGkqRDCLN7xfLaywOcPb0G6vJZtb39OEDBYxQA
 D1ru8f3o3AU3eOVuqLUNYCUydtzQ8GyfXzm9isRNUSQr/3uGVaNumG6+xN5dNJfVTnJ+wk12ggA
 mYKbfocePmPT43p0NNzX5sGHTWD8lMhWZqEdGzQBBXi2SemzCXLLwMiIuV07xrSno2TOUJfnb9V
 HteKk+PMwroAA2XtSv7NKWAx+DCxV+Z+ImFfbLmwduVP2XY4K/59RueEniB9m8gSxy4MJBVnX/X
 SPT412YBFErr0Yjm/ezfwJ8oJsEFY+YSFqFGDxOpSDqD4tlXXDfQrtF5pE9QoZESVLsIoISSepa
 Mlj0vd1zR6M+YPqCpgVpw52Sjfo2Gu3CcaHLj4hgzNRuXE7cp7Yn6tNUM999H1zTb+LJOWA1hcw
 vsIJopF3j5GGcCR7UL1Xflc9FI8ZAXI36hFJ50ik48h63RCHtJmfJeOmORYVdYCLMGhqcAKRp19
 CYAUO72Nr13KDRTGj4MX7yX9/Rf6nHO9XR95DkwSzjz6P9LN7RgXu7eO3NrGOyaMucIVW8B86KN
 Zo3BtkhFjWSS6AlUu3/pZ1JvZa/QrR1HKHCeGwUyvdUNYLw1NvyxAGCb7LlrdCSx6TJ4HEZDt89
 ngLM+Mt2UbknpZQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_163846_482995_3D6C4E09 
X-CRM114-Status: GOOD (  11.04  )
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

Add the conventional blank line after the local variable declaration.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index e0c91719b4d0..04163c3f385d 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -315,6 +315,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	fw->chan = mbox_request_channel(&fw->cl, 0);
 	if (IS_ERR(fw->chan)) {
 		int ret = PTR_ERR(fw->chan);
+
 		kfree(fw);
 		return dev_err_probe(dev, ret, "Failed to get mbox channel\n");
 	}

-- 
2.56.0


