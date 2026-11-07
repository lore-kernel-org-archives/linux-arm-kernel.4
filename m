Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4225606D835
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3w+iup84;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ICOVPZVS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvJBAxmd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=; b=3w+iup84wLUzU6
	p03xDrWRIW7lxgv2T66q0xEp8n2UboBFKDvnrz88F8JgKvxyvR2bUCzWe1ngtadZCQQrW4cLkbbYX
	3Q30dIGxctAiKy4YUn6BXBd/Qr2AmVhf84nuHPPaDZ6Sh4sISKdUciHLU0LCOm3VBuGTX25eKENlV
	fQpYsRt0XIwkHVMwmFi/gcFZ9SxGOG/4vNdSg9Q+KSInmDUPdOChHOLU76/fjO6+iRE7WA3g6cWdM
	EWAmZRpFgud+5MD09hI+bVKuUOlc5pfIQtaZYtC1+rLfmFUviiQi8kneW8RUHfpMrClFJVaDePXTW
	KEn9xdhOOTINUSndpNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRW-0000000F0c4-23TV;
	Sat, 07 Nov 2026 16:39:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRL-0000000F0TR-0r5Q
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 07 Nov 2026 16:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=; b=ICOVPZVSJ+QyfSJAV0VK605ICV
	hg+v4xBwGzU3rSjWLcCDcfn1OTwClYNvUAUOuYcVj5yzwLDlJWqN7kwTF3gFLsuc+2Yb9JeobA55H
	0rCf68GKA6N2hUtCiRKhAuoeouj0G39uRKCf1Ht02I6lvoJhoqT4JjX1xlQTGQ5BQJEiFXB9dPGhS
	hcAiJqG/MtHhyYmhQ/6thtRsQ9Mv68YgwQXvc29jNY9pxSzGYpMabm3VR95pVUv1I+gJf6nLEl9No
	6w/SwLVp3P/fTBBH89c39mhBBuwsdaXcjiaz3JF13gAHVHURQq+uwFzHoAbN1Ho3iriMhs8cy/AFu
	rli9zA2w==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRH-00000005KFP-42Or
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:38:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so12027615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069526; x=1794674326; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=;
        b=nvJBAxmdyYzT+HEuOF42c0U5mxDe5mV83yfMZ5IyRSKvzuHTFMeDd3eVIpjvrPvwzg
         1sH3BGph/CmpZB7bIHDpKEKkre/KlCDXfrzYpRAEJrVezbgMEbCKwNgx2uQzmB2SMr7r
         fSvvNso6S6DCxmGrIjmQRon5j8QExa4xX02Pr+/XVPK+3OdHgz0yNw+YGPD3W79SVdat
         ur2uAzJ9r5Iw4YKm1rECAKiO8l3Y5MnQCZ/vSN7svOfefjTwqdRw6IE0Znwnugc1kEsR
         QveRIdNIbNlHQKnTNGteh+E6hAdSEN9t7YC/3YvVoBhD85zWPrb6ykQAI2gR5KPKio1u
         fK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069526; x=1794674326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=;
        b=mm38pqeOGtTW9GLB3mb9LuRpdvaoEi9Eae8CzymTZpDxp5CHh3+p17I5/ZEyDVE08R
         mR9bB8+wpLC0L13NJIv+RWcqNoSg36zY0uTeMSEkq/TR1ZzDueA1I3kXwSjF21HfTnJX
         QGGsbmjhOVCaCCn9CCEpYaVAfZFdPz1cpBkdPhKN1cHZ/cSQpDZpehk0y0PL35O59Qg1
         KjW7ABIMrdfvRlCOCe3F/ER5mmA7cPPV6f5YgsZbhoY05My+F0l1gW7Omt1ga+9ceEWg
         ABaIUWkoiqlMoKrI1sjDP6+snf5wWLLWzFfggLoBHTznMPf7XksvQCFQ2MG1SCYUky2H
         V32Q==
X-Forwarded-Encrypted: i=1; AKwUvByBtvibmisBSZgkD4j/CTCIKw1x5f4BfucFpSQIaFdLhXgkyO//8/brWHm1BEjHsM8YDC9tukV5bTUBNkhH/Bqk@lists.infradead.org
X-Gm-Message-State: APuU4Z9wVtGCeWSUl/yXka+JZ4n9Al2NhAng9Js3xm+/YKHfl3BmB6WQ
	mbRJ7kZkmbHsu1SOp3YR3nvBzM48WzhUVS8slPyu6IyPZVJm7AK2MRfw+UNA3WHL
X-Gm-Gg: AYBFou34YA9p0aPgXplraGwSji6Zy2Zmw8p5jTObBliYuxqQim435butHINLAQWUBG+
	YYop7tVY4eofbmGDWLUXUSvGQ4TVEopXxQkKZD0fBio7GSr28Cqm22Lzll2lIR5L+0f80ZZhyBi
	lUg9wBFMWUMx9L32tHWCIcgKXo9CJaRdx0XqX5Gd5Ufm6zV5BnEiF97l4ooOjPOBhTjS5qPjEjL
	iQ43bGrJdqoQ8Iv0s8jPYEyVoQev1mJROZG2V3Q6l0Tbifx+upF/dINx5OO9+UkhxtmYQxc+nBe
	uK144HKAo2zj8K2M+tZtwpVytNBQRFVRdwx0LM9XaZmBBFozOcKpm0S/a7HiHuunUkN3/1kEvDB
	Lb8hrXeYIMlyW8I5nD7u9zz6rrEsuzCeu9RWEqssGmW4nKx3jQYyTpcWEzWmuvMYQK/Tt6XJGfU
	8xao5CB9sXhiccnX+4DthRaEl57aDE9qirOyU9FZW+TV+klSnNyIJ0z1ctfSntgfnvE2sno5xLk
	Q1IniS2gztGaYwBtd4CVlac5FvI0ZBKOMmThZwYsK/2nrM3OUruUQ4FmbMCgFCViSafdBgTKLyI
	LK6VIKdwoYRFHEIiMUNhf8Ys6SwQ/+SV79Bil7lUeCh9sNUcjdfKX13ulYqmxhkXin9fiE4AvTy
	Jukf70lfHMVziDH5Iz3YZpv9uEoX8BgnmqQRxLQ==
X-Received: by 2002:a05:600c:19cf:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4b6de789199mr109400575e9.11.1794069526433;
        Sat, 07 Nov 2026 08:38:46 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:46 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:09 +0100
Subject: [PATCH 5/6] firmware: raspberrypi: Document memory barriers in
 property list path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v1-5-707362c710cd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=P9wmJ6Smi8MVD/GA5S6rtkoUUYTGbgyj85KQ4DXkfhY=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRFlLMnlbeWb11lO41qioslLYVWcI/ZHRz/
 v4NLYvUx7CJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 ZwxOD/4og+dmsi4eHShCswi47DDv9ZHedikmZkzDjOGZyYC35LtAC/RuRjfTE6hdkqjCfTZAvLJ
 90kj3EoIKiiB2E3UlFRjsvM7qWyS06TYSpHU+6Y3i3gTfMZTAbGcodIQCCH5Gj2YayYn8tNPtg8
 S17jhQpBQr+eAiHhd2NMtt/PhKCXwmBVfYrck/qZsfSC4xeNQdfi3aaaykGfgvNkWRhqfQi7fQa
 Tfh2JYejd8qdF6TC+VZPgHziKKh/+wh/j0O+aQ1LTCH3aWUVtbF8D1xb9D8esp8Y55MFBgnxJHc
 /QX3fw1yW1aho61RKhNSMQMaKd7+1BCrdCFaHtzbtivpaNTk5ZAPKUL50CEx50ug8Xc9m2lDPjX
 AAw5cs3Jl2aJn+TKZyniqgpgNmtsk4vV0HLJdLFloqfO0YnJPezfK3GnHCvnLNjOyBEK/nvL6Wt
 Xc2iSisov2RiNoQqqnWdZVWnw8l6RtWQWksJXTO3UPfed/BrKG4/cy9QtsMz1Mc+5kzqqUBAenr
 BzTFuJN6wyEhDFpFMbx8dSwugn/gZcae3KcrjcrSZCLcN1t3oU8U1xhIWk4eplcGSP0fxkbbkug
 Kdb3mnv9AQIS/iIGwq27hbJCSgiJ3zseWcEzY1c90pGTAwHlMMxSd9q32scL3qW9UiHRsUIOTd6
 aTudNqUBZQTnN+Q==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_163848_005543_4AD5B5F2 
X-CRM114-Status: GOOD (  11.20  )
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

Add comments explaining the wmb() before the firmware transaction and
the rmb() before reading the response, as required by coding style.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index d9a569a6dae7..57f21e4e65d6 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -110,10 +110,12 @@ int rpi_firmware_property_list(struct rpi_firmware *fw,
 	buf[1] = RPI_FIRMWARE_STATUS_REQUEST;
 	memcpy(&buf[2], data, tag_size);
 	buf[size / 4 - 1] = RPI_FIRMWARE_PROPERTY_END;
+	/* Make sure the writes to the buffer are visible to the firmware. */
 	wmb();
 
 	ret = rpi_firmware_transaction(fw, MBOX_CHAN_PROPERTY, bus_addr);
 
+	/* Make sure we see the firmware's response before reading it. */
 	rmb();
 	memcpy(data, &buf[2], tag_size);
 	if (ret == 0 && buf[1] != RPI_FIRMWARE_STATUS_SUCCESS) {

-- 
2.56.0


