Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F7F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XGvzUFRR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LP32ZZyR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jLheQF6W1LFri0+j1fH9wg0sTTI0eF4EMKTUTC/ER1w=; b=XGvzUFRRE88lz2
	XUmfuny+o1kw8fanxiCiZJFjRvJC5TZ4eOxMmTECEDGva5mWODEBBsYVLb5zjGk/CVbBt6rWvSlPz
	Esj9gNoKGP7VrTrS8wLJ+FvNRjLE16QEaMxvLt2AVOwfuEyFzh8NSIgjeVdPmjzG6XT3CCNYoNfZj
	4YKwUNWru4Hwp9KBQA5prHgkwCvY77SNqX103RSjrkAwfvvbMJn7DK9I8IySGQka6LvYqhKqn4Xt+
	t/nHvDFVztmu0oLZKi3G3Cgg8nVgpoB8hVe51BIDuabTl66cSs4vkxanpocOtZWTNcLI5X2EdI6oG
	BaKZYNpPuSkX7Vk86tNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp10-00000004anF-0son;
	Tue, 10 Nov 2026 16:48:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp0v-00000004aid-1yzZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:48:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so22466235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329284; x=1794934084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLheQF6W1LFri0+j1fH9wg0sTTI0eF4EMKTUTC/ER1w=;
        b=LP32ZZyRbK3jtRWJf+GgLVevXzeIIVYhPYQp9HAfZUvEf2Bf1Hy724/WeU2cT/T1jh
         4/zMsZGSSTOv7yVIbirvmydtKUCKBJ5SVSeb09ap65KCOnE/UELEuL1CfrKbH+vdUhpU
         pZrLMnmedWM2G5/amPOdP9gEh2rT7G1Vhl+S3Bqkd49MfRm/q0KqTkkH2GJNNL9fPTXI
         zo/9kzr+J9C54g0N7EpN54FX6buSBWLxdJyQRYBGguB9cDAqNM5XLAwJV6OAYNODVl5/
         kmtSuWy8g4SNVgcyb0dGds4k/kJIzEZMi/j+tJ5O6jE0DUHTSzgWYNNIOM/HjX1W2O5K
         Blxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329284; x=1794934084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLheQF6W1LFri0+j1fH9wg0sTTI0eF4EMKTUTC/ER1w=;
        b=hrt2ThdIc8HCLSd/V/dliE7dE/z5zMR9VQvhpwIF3U0eWyEwbsyUm8onWPecx0yKIC
         8TnnAsov+ZH/35v9lSNIYuqwD2YyFcoc9k820DNkcXRfuGsR4mNRO1KgkfWC53LxTvv2
         Efk20bHt99SnTNw08s5/xy/BM39trrV0/s3nblb2rn46Zzor2WRGAJUdOUv7FqzAKEQJ
         8HLSxfOGIsKRq8+8QIUxTXFGhJ7BVcWRKDgr9YUqLPx/AObX9Cor/06SSubbKtPDgjuj
         edoH5uuquBhrrW3AmrDMF0b73KTMWkaXvcAWSLYlyjyM2oVgZ170LZ5fmq8pdZQdCxmu
         yR/w==
X-Forwarded-Encrypted: i=1; AL+hErHCurAygPnQp4OgJ0DoSm8cSNJxKIPnafMj9DKiuIjFoTmgoeYZNz1gBLV6EgZkkFm7Ra+8e42Ud9EWDgBEl8Z4@lists.infradead.org
X-Gm-Message-State: APuU4Z+nG6svvuZxSViNABbqcxiVOYYRKEdV5LyCbgAJ5iPc46pGr532
	SWZtvLvXNKW+hXK4Ex0Yg8YOrYFaVXuLOuh3mnofIcUeTy3usdYfGglp
X-Gm-Gg: AYBFou0eWwFklUYp15XTZPLwqYNvmH15rCzA0ILvhABZeJMB8AEuVH48YV+UVsHPWNw
	TieISDBG0pSYBNJoKTQCy4dr7fIhaxtjc3KiY+M6zfrBqR1IuLAFUeWorv2gYMBBcNTKBqiamth
	bdzFEWesqhzpSSiXO1lPFvS+FpcXkYu13A5KavMrQJUS47Ru+7xKqdORP358o/sHbKS5TWCwdcE
	AfSzeEUFaAirBRErJ0WmX+3D2F/5hOY7efDwjOdeMyh8TBo7bowCUDxUWBv3i+El4hLdUYHPJJw
	/sBUtGyU1ZKkyOxYcLJILm/1+fPjZRDPn+Gkze+rIDwxIxRj7YrRPXXhq/NT7z69n2m5fZD87QB
	N3g37Up5RikvCrqW8tN0bhl/IPYscIG2peK3XKvO6D9Ue9PF0sFa2Cdcdxa/C1wg7MqedgtLgW0
	cwhwBysvh/lDU/8Uy1bzh4TzNdkQsgfXuRMzymmLrtDqGnYDU1PynDuBeQS6HOfVWr8+wfYlcTb
	a1Vw6ZSGiU/ozUXdWee/YvygAgZsFQFECNPikpk6YJqHtR5dw+dJQdIeIACiEdxXD9cP3nXDA6f
	LcfQEIgLr84qQ/Nheso7aFZ4XPw9ad6/0G3cljc2Ud3LvEYHOxJWfaMbB8jhHw7zYMabYvjECRH
	opb4tHi5EfbQ2prA=
X-Received: by 2002:a05:600c:6098:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ba02358e34mr57908015e9.31.1794329283656;
        Tue, 10 Nov 2026 08:48:03 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:03 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Tue, 10 Nov 2026 17:47:48 +0100
Subject: [PATCH v3 2/5] firmware: raspberrypi: Fix indentation of return
 statement
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-raspberrypi-firmware-v3-2-e001feb542dd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=779;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=7sDxVWSqwejFDqOAjIoLd+iPbqF2wOTBa0hAn4PF2nw=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80rAS/QfPs198xpDZcp/E2wIRsfwHmmJsZtOY
 XaXmEXaGyqJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKwAAKCRB4zXhFDAXI
 Z9CBD/9SjerHFaYxJpf7NQEpGPkfEIaY6AD6B1MXiOFzzObg6X1SqDBtlg2Zy2Aul2z75f0NOyr
 m3I/Ti4ybJ5m4ASeCzTGmirRO8DUevEWNAiYugyhSblFVvTNZK3CunUlRZ/bCxR6pNjIm8rHV/w
 iJkD9Y2wjE4BKHchdnTWLX0xBDtgvGo19iOHopDHGQDQgOMBZmf8JXo0EPXsDK2MTdbsS5WAAaG
 41uTymG3ZLK66bRtTNDviLkvZPWgSRYqwOfj+G22WvHjvk/xwSLaah4luwa88R51Exxy7MHXs1r
 Gx4W9+O/Jw1lu6xbo5S0HxjZqqUGYALUlU29Gm4d6SAZdbBhu2NfFoUDg0Umn0NcKOi7QONwlW5
 sadh/v+0zmEWe/hmGM+evgfkVw9NqVYSXOGpFnKJxOvLwQyoqFOBRaKRydQjtBE1FOBrvfbbb/0
 V5tvgxL8oVkFI5AZmI3MWwy0/x53v4lQLGAQpR//6fqVtvSFJM2i5WpQbSzj7zIjInw8cV52x5j
 pT2BT6j2BjMhCJYNGmlaJ5cd361BovOYqgO5ouXnIZW5nzmpFECpuT967M3uzmOkvNj2BoYSClT
 JWW+9T7m+Yo40WoZfipVc3us4CJaHVyowSH4gcPuBP2/1OHaRyyGm6O76GoNqDsHfQsTYwHJsIm
 7gdy64tKPfCX8DA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_084805_591665_F8C40EA3 
X-CRM114-Status: GOOD (  12.66  )
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

The return was over-indented; statements should start on a tab stop.

Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>
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


