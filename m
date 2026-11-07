Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C312C606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bxmJrMPw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EZyTxXT4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C01RxcTL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=; b=bxmJrMPwHK1cW8
	fSF5XyTfuVjTfm5GaVk28xDdOBxwi/9DSSfxLD0KsxbL0ZMyD+uvTLi+Nt/MzB+LCxZeZpx/XIDdL
	HgDn3vNITurZWeWB94oHxHNjj6hIEuwwbnqpb57ogY4ceJZYJMnA3l9fzLB0I6uWCEfbhPudQrNeW
	IfKHyX9YQ1iYePqMFyxsUBjOr5Thc2/Y3begDfqOtn8Rx0qoWVAMHfM8UzkN3SodYD5WhX1yASct6
	uh/vGQtu+Abr+hIN2JjuTfoegs+oUhifekuK9xiGQdIbLh1Tw8XLsttkQCqHkibf922YVciCfW/zF
	qN/bJDS5M/+KD1sRFbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRQ-0000000F0WG-2JGR;
	Sat, 07 Nov 2026 16:38:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRJ-0000000F0S5-3GH6
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 07 Nov 2026 16:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=; b=EZyTxXT44qBjzCN11WBOKlZw2h
	42fUbbwG+I/JUOecVUgRZrCtX1YKY1Z3hA0MxFEYej++/oe0KTjy6SnqfbjLBr1pq60lFuUTAnsOG
	ACZhLsZP8+VecFjaWx84JPBfUt8Uji2vJ+dkI24PyGJFHJipmsi06z/fQ7g/Dt2ABCNFsW92R2KPJ
	sYFXlTM2dZrhyEuQfssNfhTSHM7j4sgQQTZP5Nv0zWZdng6h+GYe665s+CmeAelRYrP+eR2YDWF+m
	j4NOgNslIJsMjyCePqYlAH3NVa6jT8of+XOX+rpTs3RPE+4sxQGQzDX4McB0ZiO9ik/afC7VZVU4l
	BEAXMEZA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRG-00000005KE7-0wy5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:38:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so5589695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069524; x=1794674324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=;
        b=C01RxcTLH0sO5XEFOYbjQKklazleGQfiKJesTIFMgU3oB87LmryIEzlEx4tSzbQOlS
         PKan/LCqVsXWoqy4hN8jrOXv57b5zdOVbPbQHx4ASzWZERnHQo5mmCm53OEJ+Fvl/8hN
         Ymw3XdCw886b4ivfN5q5Ta4F3g4EQO23UppyBJx09LUPwfMO2+USH5ky2D9h3Sxo6Y7j
         aEqAvmCPlq2acJvI+RebqvXCrU6LQmG5/HDnSG4maKphCw41StWtpg+VZsLiM7AUGaRZ
         AprIs5NRCCp5w14NaeajXS65Yplp/oFU+3vSIl7PtIfBgHhIZdAaeakOM+bNq1mD7Btc
         gn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069524; x=1794674324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=;
        b=mQk5H/l6lxVetAHBIxtCsnmh9qT2xiLqZIVBtPcfHShHnLAZjEa2n3qDmEr0LrjjcY
         eJ7Oi9rwSfuA08yTXc5Mi3DCMYWldQNSs7B7kSstI2CLiVK+7e1nIHWIHULf9kgvvi5M
         do9wiT8ms4/gaPK44iSpiLXBkuR1XDLlG3W753JGYxKROcNn3ARVndmcq/2BLyRsq9yB
         Vrhcj0sdKjc5xWXlWHrl4lWRrrTJZ42hRjeU0r1d2GlkJUK7MkWzh865wIb0bEvcIHdn
         6Cl3n59pRtdKoZj0BcT0LCOlars2Banu4CbQ4Iz2s21FS2kRO4NyP4aTKRXqY2eaQShD
         KnhQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8RgHS5MaDvPYJ3hXeYuMJ/j0RDHiBGlzR877Ik7jGMnS481BkzpbH0vNgI+o3sdPWriQdZ42qNBE/0r0c9a3i@lists.infradead.org
X-Gm-Message-State: APuU4Z+9BHEOgtRS3h7PMM06+qkUh/E+pMVw/z5V0MS53at+8HMIQDLG
	So3naAQjvynAz8ySBbkvaRCv9tVELugkxGGNk4xqARwWlzfgzTI1xb6v
X-Gm-Gg: AYBFou3H0vOEnmOBhoe+HdmMVl6KSLpar/hYmETYIm1XlGsf6XyBvh9gsZB8ZpGaFbB
	jN7C2Qi/+CRBx2EQZFV5syIBY+4vm6hqk2iZ+DsRFV1yI1C6MSFJgb5+PrEJphGyaYxvz8LZ+NE
	0ksqUGJs/9zoP1vD/6GheLJhfx8SUd28+EIGRVUAXRGilQU3GhvBrwAF3l2IOW2/vu0a2rQcHzW
	fpX3xhTxQ0R8BsqO9P0lUvJxrveyeTRXIh+AIc34pk6A6utb/kOq4edIEP44Fdy6p11ktBU7OCb
	y5NUdKjbijurS3HGiK6kCOdbHNCz5Md0OBifmqA6LrOsKbk39YfK50cKXZbOqakzXckMt4Mn7Ph
	OOXiu1N3dTzal++8rjC1LfdR8XLfnmwjp5kRyCTYgCFdkT3UrD9zqh2Qe3c45ZBTJUv0J78IwsE
	USjp58hYKG/nyRZ7aZe7dDxnkpuO9L6bnzbu07heGbExIclrJc/vQroFXELf2wHsmixWAZ1i8UT
	DGNWjlDCp6gnKB1i6SezJ65XoIVYJPthZkBBmz9A1Wtw1nSn6gA9WaiHzvda/kUWS9Gl/nxFJ3A
	XrAvzn1IbtI5OofQyxx9hxXXo+lqa8mN1VIasiaMCgvSuGYzvbJDxbx1l99sZtbPTYolsNVbOAD
	gt4QR59vNhGSfzho=
X-Received: by 2002:a05:600c:3e8c:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b8190ec934mr45669385e9.3.1794069524438;
        Sat, 07 Nov 2026 08:38:44 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:43 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:06 +0100
Subject: [PATCH 2/6] firmware: raspberrypi: Fix indentation of return
 statement
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v1-2-707362c710cd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=acy165BVhCPBqoiZ1D61v2aa3PiKHUPL5mFy64dozN8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRJ+hcoxMm9BhTxucZQP53Xv5VytmSL0vNR
 hM/yQen/7qJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 Z+skD/0evTjnpLdC96W71Q/PNrO339gm0MFuRgF02GlQBQ1sfxxU+ep9Q1Wmq1TFJJC8VtiieS6
 PvExpy4gG3PFk91VME6RUSbKwUoGrvUKZXI+1BjorOI35X2XsDNkwlPFKYMiMDA9gUzSTNq3l3f
 pTLfAEvv9LvMZSSYrAhD3SLi3TngfDa0jRrfESyvG8m4OaojrPzin0e69eMO2ZA4bJGCrV/uxjj
 5C6Dihi7vGGulA1kWpE/m4yLS/UmWzVgsWQJoNQ6UmMUaWUMJ8oRF8A/4jRcMsR4tgHjU3Q5e/y
 yKe/IdWH7NHJleZdGz5mW5aBZ19n1LsuiA4POPq4lzQuu438OW4xqI4Y8TIK1aspA4Dq0HnupCD
 Q2o6Hpre2DhGx7mK8jFtCmQeFuAJeQcLFYYvVkFyzSAKfmY9B/Z3aePINqrl3XsfG0g1cURdw0P
 iHXGWQYWVR72pFeCWbn0FbkKUyh375LSIhzvR+/hXWxSMvKQ807tNii3PsNMGdjbgAQDp+MG+5m
 1XuHibsEncJulXJftasJyW2q3gHcJFuX2DmOotrPXHdAV2j+4F6v9okIxFBZW/eOVRzI0s1Lxhh
 9gi6cqqI53+mLSmKuIFiUNdYbKQEL/sbng3PzfgK50JJ+7LX1EOlK10wRVaX/PzmJZjN7WsTk/Z
 ilmmgAkdR8c4qhQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_163846_239259_BBF1A1FF 
X-CRM114-Status: GOOD (  12.63  )
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

The return was over-indented; statements should start on a tab stop.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 8f3653c4a669..e0c91719b4d0 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -267,7 +267,7 @@ unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int
 		 * assume the maximum clock rate is absolute maximum we can
 		 * store over our type.
 		 */
-		 return UINT_MAX;
+		return UINT_MAX;
 
 	return le32_to_cpu(msg.rate);
 }

-- 
2.56.0


