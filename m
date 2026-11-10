Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE5D60A2612
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UyL+5x8h;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KaW9kQc/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vl1rYhAfjK13R83ED6coEGC+SsdHD84fHmnG4iiIzF0=; b=UyL+5x8hDsmnPR
	/94gO6PN5pGjhnKlxtdmzoHa/TVHEE9UC4yTLxtk0oPQ25J2XpLIGARTJ1XWnRNOVEEyTLNs054Ac
	xZGdEk5BBuD4hzr4w46+xrIZ18vFuZUJM26HUq0DuK+NROjI0HXm5zRmhccQ49Z6ZeEwOyleNil54
	mBRo42NQAyE0qj8DAZyjKFTlB5/ZhP3scgE6K1hDQzvqafYuQF2qpRa8lQLh5kXWuLqjzCo5dj73z
	wnQZJLBUO8t3Hq9rFWTPkckNI/1bRKRZePnQSneKEfd3UT8DCnCxaIhV7LfoLXClx9NPWeXBwspVP
	IHG+Nri83/DPZZWywjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp1G-00000004avl-2zZ9;
	Tue, 10 Nov 2026 16:48:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp0w-00000004aj9-0I2P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:48:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so20953095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329284; x=1794934084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vl1rYhAfjK13R83ED6coEGC+SsdHD84fHmnG4iiIzF0=;
        b=KaW9kQc/q2CZU8k/4TReEsGSvFQnmyKpN42QULtxVrfwOj3WYhY1GNJSFv39zLa68s
         7TbA4gkilBz3SUVbUbKxV/cziNCUFbFbuVOsVxN13DqPdDNHCro6sJvL0ZSVofffVsGj
         0Z4r73hGfL6nuLwhYuAVHsZ+92/aLHViTZH5GpxtQzQBhEnwLo2Vxa/iHcvJx81m2vpw
         n9zE0cnFrWl41w5uOLfdZaI5nMxJpPDWp06pnTAC2eAgoYzBS6NSuvPjAuFzrAx/KeSe
         XSdhLyNmWnHO+ZK4YL0KJBBartiJKh8PUtH7Ke8iu3yXdfM1iIjyUMaRqAfmgJTIkyud
         cSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329284; x=1794934084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vl1rYhAfjK13R83ED6coEGC+SsdHD84fHmnG4iiIzF0=;
        b=E42TLCzGhkykG7dvoy5MCEYqn9JJBmG4VDGImR7ECCW9FR80+YJYDTA2eFs6ZdYwV9
         hxGhAs59xS5vI8q1t8e4i22K56etyyGMkwRNvFRH1rWwinjpC7Ne/XSDjF5CjKjl10HN
         YKDl2nnsQkfzahNrIeFsWfx0xujBm16jn3NLuRY8Ii3fo6nWPLKgULEuPehPtOstIy0d
         KoKZHO3PJOipZoBOmFxXedMzDpzWlS32zqj9noI5mU9gFxvgghMk76lyHZQWhNBQX87j
         HBcWMe8hh33t1CehmFew99BVxxL0dyuIq/Do1G8nKYup6DKLJvC1FnG9I5nLovTVbEXo
         LlRA==
X-Forwarded-Encrypted: i=1; AL+hErGjZmgKX5mnQgDblwAb0dgoV+03HGeerUiBT8YzZUNTQNdTQrZWqi+KlvJgkTiB/YkLE4/LlB5b5Lsw4BIL/+06@lists.infradead.org
X-Gm-Message-State: APuU4Z/PSzTH02urYnImLmXkGudIdOyCrGRVottXmtRaK22UnH9LpvDd
	qzVly5nAZtpN1k6UjfFOiR9My3d4IoiE9S6gc6gcQydn1zWDoGrdAdqY
X-Gm-Gg: AYBFou3MzomphHt33PYOlNQ4ppSn1jZbIK32Z0NpMGtfrgvW+X2VyQBAGQguBM+2cVu
	ABUjs/GRbUyINLlgvODAswVTGf698hXt5oftapOi7HrXllJ3PVHrcyfO8k93xclaRxGPooZ0Nb1
	Jh3Zz0idc0LjAc9l8WrQJ6MSVkBsDmhgPCzOwR4y3oMeJ9amhlg/myh4kbzNqwyhI6PSJBTcNSa
	MxExSDTl675yY2/1hZGDk2klFXTd3EadOMYAPAtZqHOaeiPKtO+vjcpYt0n/Mz06j7IICuhDDXT
	Iy0ONBt5OHs4XeyMbzWesezpXjkLCuuO29dIoME0M7jg9zzNccu1v4YJrUBsDZZHJpkNp8gvxlH
	heXLlrTiycBhcVAceBigHJMulkOIPqeJSVYykr4deHaVtjb9rfJeBHqx/styAeWEkZw3L0B9YxR
	fIb8ypfgn+PukIn0f1bQ5efnYOR8Eqznn00nTDJwKh4aH3LFVubvbsYwlYPTdHU+mfBg/Q+cXCT
	eSDrk5LDp12EAwkdjSXtMjW5r+NyhNBgx2ahcK2Q274X87FgSs93uMcDf5Z381BqRi3Q4jc943F
	jAjnFBXQBy4hBr/KRRLLmk4nqfPtZr2Ro/ZadwZqxTePPP9sep5fhO6g0d3rzzsOJD2J+/RF/Te
	G18GKNqwddFskLfE=
X-Received: by 2002:a05:600c:8b2a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ba02351468mr52396945e9.16.1794329284254;
        Tue, 10 Nov 2026 08:48:04 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:03 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Tue, 10 Nov 2026 17:47:49 +0100
Subject: [PATCH v3 3/5] firmware: raspberrypi: Add blank line after
 declaration in probe error path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-raspberrypi-firmware-v3-3-e001feb542dd@gmail.com>
References: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
In-Reply-To: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com, Manuel Ebner <manuelebnerli@mailbox.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=759;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=oATCWeVNja5PpD9R+W2V7XOTEMrBChRYypl1NtcmQ5o=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80rAIRFFQXasrIwqGTrwSpqg3wa5LcMTP4/9P
 Xz7kuhtWDmJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKwAAKCRB4zXhFDAXI
 Z4bVD/9FjhVpXzZfrbS0bLJE0dn5UsBGcQyplnPX00c8QKHXHi9uYRS1E5E1yBhUnGHNX0/7mEu
 NkO7ZbXhdzVYxO+klLVGZWXaEy91QGigTWq6d/1ZrnVUEtvkzXveNO2owghVYfF15tmXHfl91Yx
 hCishgAVMlL9V0b5BC/Yy89y0F6aMJ6oQsKi+Xv8YH0ppjg35NiRT4Kk6UWlLgDFixRcyMW+6fF
 IzYX9Bpb3vRYenPvt/Y+s5CuPaPF08kjk2/JFima+Xh2Ma8kCMnZfiAQvA/6nnrlG0j9XrMiKet
 xrKgYlUNBpUYAaX76s5L8Z2kJohBUwJN/uuIHpwwO4qBYzlkZHd+0PFDZEJL030udF7iPIFWNjv
 XXnytqCdEaCQhNzOC/hz89Zh4A5jJXooYPGnDz1DRij+IgfUKPnHQV4zH06iGTAokTRqcCembdJ
 WUCFNN/tDxIFNXhzFg9KTszfPd2zBUNrdAR+QHnVdXekr87nsfR9Xe2/gkJoPxwvL545FvO/4jK
 yHO8Xi7MuJNVL6i3llJ+Oq01293Yj4CHOY9ym3jHwuZavGc7jFeFfr39VBDl9fwUk2MYSkFHZrm
 xugHWzfsei+tYtxPtCqKoPpm6baf1rdvSilo8uBXbMqKcA5ULIBLRs2Ijg9q5ww61g+YJOx1DPl
 0US1McX57zjl8hA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_084806_219262_45450A54 
X-CRM114-Status: GOOD (  11.13  )
X-Spam-Score: -2.1 (--)
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

Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>
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


