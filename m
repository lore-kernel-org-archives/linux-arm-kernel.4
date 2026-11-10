Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2579260A2613
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pjf0KEwJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UA6KQGKS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZKnuTzByaSSbot1/XuQEQnimjuDaYE7NsL7Tsbajd8w=; b=Pjf0KEwJl+3hnY
	JiLkYAOnQkb4Pk3vhkhr5jKbKde8MAtMEkt6HySK24yvX1pc7jYrBfu+/d+6754bihQhSTTXIwhlR
	VZBgHOWcxdGN4phj3blHFZQmswlf0LX1geMh49Nazj75hCTyIudKkfShQLl78+SjjR1Lzdhc96fUw
	kG4AErlpReynmx4kN8rHV+XOumjp8ob/s30vC+sAD7tDAPm6z/B4oCVPHBmeD5IT5ZCvHYE78Dfn0
	NLafV9hYh6sSaosRHLZPRvvexB3MRV+QqnxMSZtRBo3X7GdsG1hRTD34JM025bKknH1ZWYOt4F61e
	ba5j+oAuAd1nU8rynTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp1D-00000004au4-1wRv;
	Tue, 10 Nov 2026 16:48:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp0w-00000004ajb-2yLo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:48:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so27136285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329285; x=1794934085; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKnuTzByaSSbot1/XuQEQnimjuDaYE7NsL7Tsbajd8w=;
        b=UA6KQGKSbOrCeDbHZA6gOx8BByuRvi+cJinuVdRHNdaoekoIzWt/C5OQmVPe4p3ARE
         cUfFZ044QHqGIzzi8Jr4wzhPXEMwr5cO38+Hb8oVV3siqk13JDG7jlb25K+k3vKMPjk7
         UfiHvPA9U1YKbC8WXAz6RAjM8uQUHysbrAP0prEB6HWs5gTCqiAhDO2h/NR/S0QnYLjI
         jxEP2EljCE06EzC8zNOwnCnQr46LliX14t1yRegcXCzYEHwR/lZl/V1E4duKNol6pAwy
         yDmeuYABI0GxAWsI5AEBjYCKT7g+me+bqFdIrwv3Zm03QEPOMjgCRYagZkwqq9Drnind
         /fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329285; x=1794934085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKnuTzByaSSbot1/XuQEQnimjuDaYE7NsL7Tsbajd8w=;
        b=f0RHaoqbyoAJ20YpLHtsyWhib5I16oSazU866S91bafcwl7d2KKVCPmQxgNANj0NkS
         zoR/sOCx8XexQVJx09VK/ce9eKRBjVUvU7hOAysE0Gv3obLPu4vTEoWZYfaQ6Q0Fc8H2
         mVzROq779Y3fAOuHLJSBFx3JjM/KfCSZSIRtl/gQkqIPGp74aV/n8jearX+itkkrG1Im
         hpwyZUif/KNuG1vYrbc7aOWdHyJctGAQUOXPZWcVy5DTUlCrWPVH1HA43eCZnwCD2+Z6
         q9dx4oDue1DZETtz1KkFs3SscpK3J9lc4aDX+exuy2vCkgIqXTWbnH2NcbyUhrGvdXN9
         0ggA==
X-Forwarded-Encrypted: i=1; AL+hErEBLsSAZ2jriGBVHuqqJxOnmn1ztHjv72TRChZZLuWeRbn8HBjQ9Cc4gH2MMkxDe9ipJowFSNb5Ke/5VsYCAjxI@lists.infradead.org
X-Gm-Message-State: APuU4Z/Nh+AWUFovtr0PJhQaAHsT+OnOVgMoLQMfELh3t2W9gaMJ0b96
	xF25sCmMwtqZ/5zs6QGnHS1FTU0mY4bph4fgJMKqULVEqZHSOxcSG4Bh
X-Gm-Gg: AYBFou2aItrdcyUc3V9PEhev0lKppyM3bg/gHuMlMpvzi1sp04Dw9BG6RG54Gn5S3Gy
	EAIvGnV8cqI3+T/Yzw12sA4kjBDooDmVl0/G92KzqXgfclL6kcVU/t6KSGlQX45qKRrKdguUwAy
	U37zrC4mliMDoZITN6SbHlmHLipHVQ0Tg+FEv+EfVBwVD6pdgYPBo35k519ScDfpeGHq4E+AaKT
	Vz9eBwYqkisLVnmJ4bjhgT4gqifeaBCxrAIN2n3adv/G4E7pYWGz25O26s0VD0vz80f4rqofuXs
	Txvfjl1kk/5EeeW/3v29HPlNBRb3AAl5lRxXGg4aFC0sXlJRzwyPMck4GMYfwY+NRlWpiYHeAWg
	6aqlahyY/mt4s5anRWUWLGyT9xne3B50WWQsak1xLR8Bwnl5LGTQtL4B7GYFD5YQaydwtgjJSAX
	jWkNWJ4jpeCtEM1s2QygJnbMmmivueUX6psF/FK21htBScXzgzcqDe07TXfbTw0Gap/SxzIOI1C
	y5o0MYuadBGCAW5GVAeaNH6aLvFP1h5HO1jp3rjO3ABUa2GjJJiLLug4YIoMPEfxPNHhEYP7ehm
	ob23mup7u4IqM0Ygxmopdz0STfEBjJW0ITR71hIFDFwaPnt7RIKHNmKO1Uy4HL5aDdpI7n+MQp3
	ljKwLYxGtQ4LaFzI=
X-Received: by 2002:a05:600c:3d05:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ba0230519amr58148825e9.4.1794329284863;
        Tue, 10 Nov 2026 08:48:04 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:04 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Tue, 10 Nov 2026 17:47:50 +0100
Subject: [PATCH v3 4/5] firmware: raspberrypi: Document memory barriers in
 property list path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-raspberrypi-firmware-v3-4-e001feb542dd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=u/0CXjUNJhX1Rd5kE+A4P6p5kJKiKCpC4dI5cLjLhDQ=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80rA5oweI1D8pEFyiEAbgaJgSX6prZmEY9bqT
 Jj1+VYvTtCJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKwAAKCRB4zXhFDAXI
 Z5qFD/9snD3hL7PG1O7mpkf5M7Iw6hLyt6XYWllAf7G+6Yux6pLRVPnMwifq0GyoWl4JGCxI2Ra
 MatpWsIwzW64Kg2ZrtxDPQgUpmEz593N6XbUCZJyRdG8GKVWYHAdT5Xgb02zGJ/PAvyVxPuLZCm
 BeLi0SNzqH6/Rpg2FQBtR2VoPkSOx91ijpLngvFRMXDQKNxvwkGcgm9SqQaUHa9ozCaE10PWx9e
 7/qiD3SVPLbMXOQt6xNbp97QoKZ8Q6Pr74JIG246pRFAUfOxKB7mqGZbhi8IdhLQbQT60SAZg7y
 uQDhWedQMeUhcZqrZfiIHtupekcsuv7+rGWylMO/D/F4mv1hHZgBHf2r1hYr4uSNQiQVUZCpKAX
 b/N1P1sGiGkxggws1qDV24srGjfT3/o344MTKIFx9hkm2wvwgerJQFG6miNinZFjPS4/GZupD3S
 YJBCpvLPzZ6JgnmItPAmuK1t6Q78B5rxfIvddhh62jCYRN+TJAWsPQsIt5v0GMYv4Ac6RGQ6o5V
 XS+2cuuKv8Sxwd6QZw6mejnAKwzaPaCXlovUIZgP3Hz6tMMZeFp3T3dLjNqR/JlSF/ertZvNu2M
 GSlHZZRajR0SFiMkPkrV80ZTRBp9Svaphle/A8gAIAbJZ88cLtJOCJtfYpoWSuKmiZQ9avAqClU
 djHiFh09WZgfmFA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_084807_213949_4045165C 
X-CRM114-Status: GOOD (  11.50  )
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

Add comments explaining the wmb() before the firmware transaction and
the rmb() before reading the response, as required by coding style.

Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 04163c3f385d..ef3326d5cf30 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -111,10 +111,12 @@ int rpi_firmware_property_list(struct rpi_firmware *fw,
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


