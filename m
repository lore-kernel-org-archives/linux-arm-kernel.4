Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8FB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yTbt8eEo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nP7mN4Hx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=g+tEAauVDFwo0LFqluBw/XabLtSrlP/ZHi6sb+R8lbE=; b=yTbt8eEohpMEcYfRiUKCZU0iZt
	TddFfmtX0CSbwnykeLsWRD8coOOkebpRNyhq14fIaUopFoF2PiZXxbFVHjn2nkzDX4yPadscJlFYS
	OJQAC4EhSo0PiOvLwN8tA0DlL3cV8bbj+G18BXg+Vs9495NQyj0ef6vOSCNNTtBJ9NO4rXP6dkSS4
	8kzEquUC86VReyTiB0Fq5knpRX+CioXZQl2HXpYvVZ68+B0tM8Vw3WHUfUgKaFAq0yOfE1Sy8rXsq
	tWe92O16l5hSqM5gMZlvkj1tFeYKKQ+U2UTlEN1KI/FC15ja7Zv4dr5yghRV0Nvkb7PC9TnKi05HW
	0apHq2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmFG-00000005xY5-0ZTW;
	Tue, 24 Nov 2026 08:51:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmFB-00000005xWi-2c7p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 08:51:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so2269084f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 00:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795510275; x=1796115075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+tEAauVDFwo0LFqluBw/XabLtSrlP/ZHi6sb+R8lbE=;
        b=nP7mN4HxRdpqHSxFUSnPkIYvLpTEP4x/kBVaSHR1gB92U1bIAoFwtn7QWbFE8Xoti4
         +XFhKGtQfV09aXCQ0NevzpXrEHGnpQIk0rBdDuIfdAvcOiK5JM8g1LBr0Y0JdyD3uFGf
         2lVy5vBieGDPqwU0GyQVKldnkjgjXDpYYvFRLYFFwMAXafWVzBYHwlmot19rY/l6Ik3m
         nkJsAf4NBK687zd7iYSyexrejGilhdKVF3P1hg7bFRBPvJy8WF9Wy+J5/LqbzB6602io
         ib+zvPdYQKjn9+9yd+aKEcy3tqzfVHx3+75XVyt0/lCDdz57fJCt5dcBqdW24WS83qAS
         hRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510275; x=1796115075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+tEAauVDFwo0LFqluBw/XabLtSrlP/ZHi6sb+R8lbE=;
        b=XItMdQ899Jzys4OyUwNd65/idsyOvr1yKO694IU/D1diNL5EZw2kicLNfZGaP+Aeeg
         TfYlU5x69LExPToRWTfTWjL7GDxaA/h2ea7/THBs37P/cS5XAarMbwXysLbvGRdYBQkv
         zya4IqMAbRqgGOlIJQCSL7IK/zpc1CtGBiIBu8IxSWdrNHTuzxAhfcL/h4JDYbb9Fw8i
         jZ0NY/StOMPmHznhDRvLsYmUkBDeIOfRLZD2fZkHNbQYV1N4AtZlHEEoDJiZ6jQFEkX/
         Zipfm0OPel/TMrxzL4oXEoyRynv8+iG0fkLi8Giocn1JK9i4F50rcLDosWN9zsdTF6+h
         B9OQ==
X-Forwarded-Encrypted: i=1; AL+hErHVG7l/tDe/rWAHuSbx2nUPnZnQwpHQh/SxezaM4a9o+JVp28bK9yub3Ikusu7wXXSsatprtdDOSPTLP1UKWMde@lists.infradead.org
X-Gm-Message-State: APuU4Z/zRZbPY1zZ7r4STFALodKYo0lM4K37rOpVdA9klcPLboOPed0l
	dX/J+ge84BIJEf2XXF3Hu2SCaXD8Eu2+m73BS26gLXTYc+3EcTMsRixf
X-Gm-Gg: AZFdTZe+isZQqGVkLnfUAngk1ipx40cAp6J1y+LibyQkN09l8Bn2riUcB0cjB2wsrad
	8aj1NNKfLJUfaAvzcf5I1FwSYZPPrtVlRZQHm0XTghN6gQzwu5PUzcvaJ0K4DjpWwmXlxLaqJK0
	D0lERdUoNC8DJ44o4EMbK02ROlHlu1cr13kvJWYmEfnlnr4qxAm6Chm1dqRtd+F2cWMBkmwBk7i
	yHSRFhO0GJneg+aCrUd8gQ6JG2iPME7HxH+deljBqSStvUns32KhW+EXzKjgeVm51UDeSf1QXZ4
	bZOMZaXsCTiBmbpM3YE3oNVSCg4k3ryzBceg2xmNfThC5MdoxniFn7RKAMd2oMpkh7/cPkv2KST
	S21xSH/QmPA+BSY40jHvR+CYOcodQ+ocXZJkJCUn3tbaGt5jdVDHzrZk+I27TE9y/++2qEyaIGf
	4HLmypMuvQAX1IeBaMsnFufUDYQdYI4JqtzFXgqI9cAkAWGwlfz8hK5VM/BmI+SwQmFGW8OmcXu
	GXFkUCTWnJAbaeZKQFdZx3i/Fp+60jkdXvXWqMJ2aC5l31nOWEfEEKL9KbYd6A8Znku+nPOrPQA
	hLqaUlplgbnBcuj81Qx0H5+9
X-Received: by 2002:a05:6000:29d2:b0:4aa:1100:72a4 with SMTP id ffacd0b85a97d-4abb400af07mr18504917f8f.34.1795510274996;
        Tue, 24 Nov 2026 00:51:14 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm23692999f8f.17.2026.11.24.00.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:51:14 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] Input: goodix - sync the irq controller while starting firmware
Date: Tue, 24 Nov 2026 09:46:22 +0100
Message-ID: <20261124085058.128173-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_005117_714634_AA60DF75 
X-CRM114-Status: GOOD (  17.42  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the Lenovo Tab E7 (TB-7104F), which has a Goodix GT-912 touch screen,
the touch screen fails to come online after loading firmware, printing
the error "Error reading 1 bytes from 0x8041: -6".

Comparing the upstream code with the Android stock sources, the existing
call to goodix_int_sync should be moved between the upload of the firmware
and the watchdog restart. With this change the touchscreen is correctly
detected and working.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Relevant bit of the stock source driver at [1].

Credits for noticing the issue and finding its cause go to matemiller992
on the postmarketOS forums, I cannot provide tags as he wants to stay
anonymous.

Patch tested on the Lenovo Tab E7 (TB-7104F).

Changes in v2:
- Instead of adding a second call to goodix_int_sync, move the existing
  one;
- Simplify the access to the necessary arguments/parameters.

v1: [2]

[1] https://github.com/lscorcia/linux-lenovo-tb7104f/blob/2dad69c9f28611ac6d3db2f1ee11b480a60d83ee/kernel-4.4/drivers/input/touchscreen/mediatek/gt912_p98996/gt9xx_driver.c#L1529
[2] https://lore.kernel.org/linux-mediatek/20261020122712.526797-1-l.scorcia@gmail.com/

 drivers/input/touchscreen/goodix_fwupload.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_fwupload.c b/drivers/input/touchscreen/goodix_fwupload.c
index 888da7538c06..642a632d363c 100644
--- a/drivers/input/touchscreen/goodix_fwupload.c
+++ b/drivers/input/touchscreen/goodix_fwupload.c
@@ -153,8 +153,9 @@ static int goodix_enter_upload_mode(struct i2c_client *client)
 	return 0;
 }
 
-static int goodix_start_firmware(struct i2c_client *client)
+static int goodix_start_firmware(struct goodix_ts_data *ts)
 {
+	struct i2c_client *client = ts->client;
 	int error;
 	u8 val;
 
@@ -168,6 +169,10 @@ static int goodix_start_firmware(struct i2c_client *client)
 	if (error)
 		return error;
 
+	error = goodix_int_sync(ts);
+	if (error)
+		return error;
+
 	error = goodix_i2c_read(client, GOODIX_REG_SW_WDT, &val, 1);
 	if (error)
 		return error;
@@ -249,11 +254,7 @@ static int goodix_firmware_upload(struct goodix_ts_data *ts)
 	if (error)
 		return error;
 
-	error = goodix_start_firmware(ts->client);
-	if (error)
-		return error;
-
-	error = goodix_int_sync(ts);
+	error = goodix_start_firmware(ts);
 	if (error)
 		return error;
 
-- 
2.43.0


