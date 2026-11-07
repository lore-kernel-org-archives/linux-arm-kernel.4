Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB5F606D81F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DIH9rmun;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hMyGl4pY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CKGq67Vg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=; b=DIH9rmunn0fRme
	2sTPwSA532V/Q8SMSWoQKc8STWSlT9x9JyN1taxUaQLwQvgD9IuS2lAsbprRr++JMYHNPUt+wifMf
	eVk/AThfZT9xpHFHla3PHogK3goAbWiOXvIebMV16+zpYE0/DjJVuh9jAE9ekro+crJrL0kWeUbfq
	MvAv/Vf2IQF358LOddHHi6O3FDH7nkrrTwaIJffawmOsCeDHx6K+G1RbQAwoTQYYtG1HY3u62ZWf3
	c3Bu8ngGrbwT82aOG2wsrKXwYP8V52AxGZoWwknInRPfzAoZuACPfRj7PXGlmi837VWfU6CDo9kA2
	m+T+NPsliu2rsWOmgubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRW-0000000F0bg-1YZD;
	Sat, 07 Nov 2026 16:39:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRK-0000000F0SB-2Y5x
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 07 Nov 2026 16:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=; b=hMyGl4pYvkCoRT+MZsO9BKdWjD
	nqhjXWoIM2XbKLPSqk0RrJdb2rypa76H4TYnNFenP1IoqJlnM+PRPn2Mc75469/PDpdIQcBmIvuWo
	L7XOGoYZV2hJlAvzHdVCJuA86BODrvQcghLS/atH9hy3Ehj3PviXqnpWss2kSGMMI/EZkkJhxKJNo
	KHR3zXhsiU9YnWBgbyN4B1qgQy/G4Ux1R4S1iMwhXDmydik01vvrEbQ9N+SJdujtVUS2bPXOzBD/J
	ziqegx3Bqge1pGsvrjKUaLw4nUTbhB28YfRO+UGp9kYUM7tuCuDrPdnzkYF/qy0oYi7qegrWSL/ql
	/VIrx08Q==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRH-00000005KFH-42As
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:38:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso13145605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069526; x=1794674326; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=;
        b=CKGq67VgPev4tEQBD6KCixLXY7rav+2NB0K53lUI1dGFGOrNw0oVrzEyFNoBoLqkLU
         G2tGgSg5qe/rAEu3bJAa0OhYUG5LXxDXddXH6izzFmAQAMBTbOAl064xrBB5AlYDsVja
         w5xk/kB2YmWHS1SYgBa480C2KD1347x42UB5YuQirZweovBFC+iU+fnonL7T7s2bugC6
         IqJh3I18vKFgoivg/Y9rdcs0plLe61D8WZaMUv2Fc+MKT6Z2EVg9+lAxbOuANky9SPFl
         F5OVXoPzPm0LcyK6ANFswFUNgwqDxciwl8Yg+bkQ9+paxOidsZtgKadgTUXwPAHJkrba
         gLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069526; x=1794674326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=;
        b=mfmDJGllhqRsJ1MM0x3bo41CDExXKAkaESetN62idFSXCCnfxwryLH/6gHUJsd/BGo
         oiMAxisA2S1F/VHPLId7fQ1HePOFvdictWYYraa0tpfQkx7nQEcDCoXGif0jjeHlIGgP
         MFU/D0Hxy/F0Hyo1/5PLAaOd3zphNm5MqTI9GI0j/Dc0hGtkDO8PKJj5izp2Gwu77CVN
         r+q1uMc/wCZz2Acmec4q262KzFI0Kf6GQOgOifhc5uuJYoRLGvwhF6rpZVkd/oDl7Haa
         yfPXT1AKAsNlhv3KVs1uZkCHV/WoZbROae4BHsgFwdY0bMyH/rbD3LdfY1XOpEiJDbh3
         /uVw==
X-Forwarded-Encrypted: i=1; AKwUvBxst4mavBq/7wHBtfpLtdqGaMz1uQld4hLWSOsCpIu/vSUd93ko7PfgyCLN1By6Uc7ICiuuoC//KDm/fBhZ/M7R@lists.infradead.org
X-Gm-Message-State: APuU4Z9huPjkRuCkoHJ4BGkhFZ/BAKmWRnZXNKLCHmUBD1lcYrcTzMOB
	j32Un3YIM0geZFyMizz2p7KNbWe50zO2TJo7buYpI1mssUGgzHtz10M27n3BJybf
X-Gm-Gg: AYBFou1K0Y4UJoMkD+K+a2mX+s5BC66L57euqaPGGV/kY2a5+rxgojXo5R6/JiCLvt0
	y3Io03TQ8JoXq9ZMNlPqUYlBHOnh0W7tLadqi+QmFldrzfdAohX/xAbGwSFNHIyiUugTcOZjDW+
	LGjcShmvstDd9v+G97Jxb2k5f9vKuttpCE98Yvo0OjcVySULk0lNValcG06ffHE7Tn512lfr99Z
	TpDAORbjJW9vciMno79u33xC3vfAMfC1QL31C5wwmndd+0FpWrlpFAmb9J5VfTXBxPCCHCo1ivt
	aClGpWgRtOx9v0zLDZD3cqgE2MUWNX6qZ9mMw93MDLv53eJaPiR+zbhWSaBtQOVThpfBY8Io7+I
	irLRa/t3FznWIcQ9uOEUwIq4V9adhKsoWo2F01APsc+wSYBZiRgBzz4MVZdDyNN24RUho3AddO7
	dfsW9jTJ3hidL9y51Q8kFCBK5YXtJREGX9CZNFeyXXJVDCUC4A9751YkPMAOmWCK4XjK3EtLGxx
	Qrdvb3kndbOLpWCvFaoOvSpqZSCLa7kkuVPldkjtUVQsTt1vHs4LRox/wiLz6btHpPl2n/nFTay
	FkFY7J6X+Ebr90lojRpUnu4p1uuLLlxGGf+yLzmnx5guc7Sq3LMFrYAP+H12ON2C7ZPA1zWhRXr
	3Grx9lzYw9mBcPOY=
X-Received: by 2002:a05:600c:6206:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4b6dfab3fa9mr100515655e9.20.1794069525785;
        Sat, 07 Nov 2026 08:38:45 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:45 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:08 +0100
Subject: [PATCH 4/6] firmware: raspberrypi: Remove unnecessary braces in
 transaction helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v1-4-707362c710cd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=R8pNK8uv7/mdLr9QZyRKpk7qvj0fnfV1DdkNj860TPY=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QR5PC7gaudY0cAfXzsqY320Tt41IkMhILgT
 9tLy+DoLZmJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 Z9LfD/wPxoPXBI8XQxGlbbYTYfiKQhwcFZCxfqsS0TSYyMpXwXZ8sNE8NR1klea/xDW21FdP1fY
 B5j0hRrWlV2t02OtXlRtB+tF5yrK5iS7NyomAbj6hD965lhsfCEyqIzTlkFEPmugmTv4oAWCuGq
 E30g1unfsaCVY6hK9Zwy1HT/0qpXmzFVy6yASSHkL0Muawo/ha5pr3HBmjJtZEoNlXBYp5+EoIA
 b3wViy/dCGa3RzGRPADQgwmcCRdtabTcrdMqVMWxjK/bV51K6OrjpLUESIwf/d6f+6UqtpV5eLw
 H1e5FDbzNPAcJjwwD/FX15Bn8B7xg1txHzWs55Ngcal57l2E1glmXwL7m1rIhZCkj6BZQaffBwl
 vgomsMYjggBb14uQ1quJV3JNKTiKFZgezhISXlLAWqu+WnK/vCMunnyhM8vapKRRbWhtDydNOFY
 e9QFSvjjzpY1OlKW53JplNWTmi7FI63849bSjQx2KdYmJUyjALLSQ4mmbQg7IRIQ7w79fQuert6
 SuMZWftAHwJ9q+bHkpxu9ev8yCatOSSqMsXwoxNnoM8N+76TJ2N8UGOserUkaSbBKaNWOMtFmUB
 YICz4dprytiKYMKe6q0n9gAYPJ1HIUq7qG+WebjY4sYdNCSqtwZv3DWt45RiXO/UfrgiCteXp+9
 kom68PVTxmIMbSw==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_163847_981346_4D602A30 
X-CRM114-Status: GOOD (  12.30  )
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

Braces are not needed around the single-statement arms of the
wait_for_completion_timeout() check.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 04163c3f385d..d9a569a6dae7 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -60,11 +60,10 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
 	reinit_completion(&fw->c);
 	ret = mbox_send_message(fw->chan, &message);
 	if (ret >= 0) {
-		if (wait_for_completion_timeout(&fw->c, HZ)) {
+		if (wait_for_completion_timeout(&fw->c, HZ))
 			ret = 0;
-		} else {
+		else
 			ret = -ETIMEDOUT;
-		}
 	} else {
 		dev_err(fw->cl.dev, "mbox_send_message returned %d\n", ret);
 	}

-- 
2.56.0


