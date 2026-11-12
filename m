Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB2C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3KI307MG;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=aj++ih2p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=irmL5J+iRGjahND8KKQTrYXMjS6LiiFKcfsqoUbplGk=; b=3KI307MG+1snS+
	vX4wMpLGsjV8o5iyCOasixIJg+TyhZUIAKNK3rdYkWRgOC+hJsnlg22IBKiM9LqwuEnQg+bPmXoYO
	rX0zM71IiSE0gVNS3nd1KeAlSgh/VYcWd35rGX4cVY5sQSRo0bUj7IBO5TXjyaaNf+LLpGrvEDBNH
	eNgvicrl9jKKImXeTDO7MuM/H1A3Z+D+h2eg4hH7jA11b8R1uwuvk3lg8B8I5S1V2nI1rCpVpdUma
	sKCFpqpwBqIGcKbUSfFa0A6EpQ6ZvGik8UFqBR7JTdY90RRQYFKL0vUQPXVHg13CRH44HaaD/F2En
	z2VQCJbWU+O9prprjnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSqU-00000009ep2-0Yld;
	Thu, 12 Nov 2026 11:19:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSq1-00000009eWU-0Wsd;
	Thu, 12 Nov 2026 11:19:31 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77E2FD77;
	Thu, 12 Nov 2026 12:17:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482223;
	bh=Sh/fFkblcim2sBVgut/V8LcfFgwt40wOVutD4SrDAW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aj++ih2pUBMzFCB/ToinGYiKbhnNJvJyJe8PgnCK/fyKKh7MZ1EonpP5WQtbg5jF3
	 hZCLOnGxvY7l/HYTtXV0Ha5WOMjv9XnUyc/bA7VTBX1JjlPakoyFSKco3YBKCdK2m3
	 r/bPtk58t13g/Kwh2OBL/HG4hw1TSDl5uDSulRxk=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:09 +0530
Subject: [PATCH v5 11/11] platform/raspberrypi: vchiq: Add helpers for
 vchiq driver data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-vc-sm-cma-v5-11-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
In-Reply-To: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Sh/fFkblcim2sBVgut/V8LcfFgwt40wOVutD4SrDAW8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB+MGj0mZOm7Frm5eJ+8tYoAivhxuqiSGSzN
 5Fcd9ikDgqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgfgAKCRBD3pH5JJpx
 ReD7EACt6LxaokkuMdW2vtsU4/OSh1GgmjapvL0lbgvzDXXSQ3zt9eozQySyX2X7BDLT9GSp0Ok
 gHhl4J+kc8d6lMTZKMypTx3fyA/IffYokigEMGMRmBDBtOjSIYH6bdesdkPd9uXMmh3bBOrFAsY
 TwV6/1CH2OiLCmDcSsSG1nn2OWJyh7xz7RLyqaSiWQFuxv33r34UccdubfSLqxfeMeGDSwXyuTN
 eKN0kvqUBKYHgXyf9CFcH7895GWdPuyMFLndQu+wdEU9FEOzhigzV0PgCgOORJQ916q2pvO1Iq5
 wGzkFJYZyrW85Aktk1CVIYOHNkPTQLZLmGmHwkN6qxARvbeaQwsa3MZu8MTjOdYrzZdxuotJOHy
 GToCAKsT9CjjAjNIbPJMVOmti5g/25E6/R0c8K0uCf6hL1SdM+Y4dTo6EvkJjSbQ1uPQoa0Kyol
 B69tv7JSiiT5CGvPJXehIKLdn5wFcHDW0KY67htE+sToSMCfXkWR1Ml0mqlbol6OHVFTDsC2zfn
 u/sfIRqMz7oVipLm3pvQJ5UuNuJDzNv+1jFjAcmLld94lbt4Ah5kLDfsPaa/i3j9w3TpGh/nK9K
 o1Ukf+dxeyds+DpDQriAFW1fPAAxOicvNecn4yYblC1WUfZNwMijnT9EA41k7ssDlfitWgeWpmQ
 O3DyGP/h/dO6dIA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_031930_020087_6F628D31 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add helpers to set and get vchiq driver data. vchiq_set_drvdata() and
vchiq_get_drvdata() wraps dev_set_drvdata() and dev_get_drvdata()
respectively.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/vchiq_bus.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/raspberrypi/vchiq_bus.h b/include/linux/raspberrypi/vchiq_bus.h
index e52291a3b247..513a144bfbe9 100644
--- a/include/linux/raspberrypi/vchiq_bus.h
+++ b/include/linux/raspberrypi/vchiq_bus.h
@@ -37,6 +37,16 @@ static inline struct vchiq_driver *to_vchiq_driver(struct device_driver *d)
 	return container_of(d, struct vchiq_driver, driver);
 }
 
+static inline void *vchiq_get_drvdata(const struct vchiq_device *device)
+{
+	return dev_get_drvdata(&device->dev);
+}
+
+static inline void vchiq_set_drvdata(struct vchiq_device *device, void *data)
+{
+	dev_set_drvdata(&device->dev, data);
+}
+
 extern const struct bus_type vchiq_bus_type;
 
 struct vchiq_device *

-- 
2.56.0


