Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A6B606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 18:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jQ0/ZrJj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQeZ9e7w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=; b=jQ0/ZrJjliL/Mi
	0GP35miFGBx41+8fil3uoWNLuKqja3DUTN6MTPsmxzjKMPjx4hmBgls+iEki1KwypxPtWYwWQFlXy
	ey30+CR6lrVR7dH1S5LET3d7T94S+FvIZfl+PJL3mSqz2PsE/4HzPjNYyMsxHsRG+F/KlcGhenPnZ
	Z6/AEHOSHI47Z3Le+k2oHqFl0Ii1JAF5H5iePi+JB4N6YKQi5qHucmP/yq5i3bITg7+CVSsor8hcO
	WVejVmvJX+OPMKsm0ZAkDBCK9aRM+tzCtjv9lLqtJDq24C8GINnT9ETcdutZfO8r9ukLEpDfRxP3O
	ykkX2qDT8pHouLEw7Wgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3f-0000000F9zH-3Des;
	Sat, 07 Nov 2026 18:22:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3T-0000000F9q1-3rhE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 18:22:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so17459715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075738; x=1794680538; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=;
        b=jQeZ9e7wl28VUfmC8rIY2QE2/o6lR6NVPBhGN2w/rk1nd9OxByC9w0ERL643s1mVAq
         X83xqyQvoKfpvgwbycDKKGqssSzVUN0lVaNxzJFdXfgoWEEDj9o2flG8fLhLQQ29xNeD
         yh/vP8Pn+ddjvuGwniLRbctkqfA0DgpKfVAQO8eXlLUmEgdvTgLQl65j2IW2WXOaviCP
         W4mhrlLj9I80Vs8u6vIswtNFJdP9Shynu3d8V5s2/rShtcjNGP+RUwba6qUh7OC1C9sx
         389gmIZX/uWzzhYuoA16dIo9ZTBt0WoRFS+tt3HG6Jo1Ib0Y5eWIauG/9a4WQ1qc8ye1
         w26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075738; x=1794680538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=;
        b=t6S2h8GtKSQ82h3sR5i0LBvKv4GfU9978jXznqtSqr5dQCu7aGGqXl4MCFomZLciDq
         xSNyTU9HboOMxlwKNJ53Snp7Ce4sGP+vuwzl0bKZUoYKmqxQxPZyKS4Mpv2Fdy/quD5m
         xhri7+CUXY5Y3D2jlt02zcvZn01Ccdbh6NFcFwiB2A2yP5YuQqBQKECnDFKboOtqqBmR
         dfGneF4B1HnYHwcGsTRmuEKHwIZhigd9qyiwE/ZgZaBNd+0RDRwV0gGoItWXGFZFQjQp
         K2c/Aks3KV5uRehEGH18WoaYuAwqwAMIVI0GEt4jTOcC4bCOjzSDNkzHwgGbX5LszMRf
         ToBg==
X-Forwarded-Encrypted: i=1; AKwUvBxgKtjIJb47hyWypKkev3DB6Cyxzag1bjPG4lKeczH10pSsdCnMRbsA3/22IyfhakfRkbYfdnvOLos/jjGruWId@lists.infradead.org
X-Gm-Message-State: APuU4Z9W2/msltNev7vRwINZ2fA1yYw9oOvtVBiexkzttIILKQL7Z3pa
	wB+rJu13ygRjjjADAUVbgWwpZ83jbDnTyB40/QUo1c4MBfhF2XtgthRd
X-Gm-Gg: AYBFou2LT1x9YivNeCUVde/YB4rzub0eYOAKpqx2IgsMt/xRqwlqV9vq7funvdGPlmO
	UyHlyfr7aCn1GO5wgXZJZJKh75sEOQCOtRD1xranWh0olKGoWfj8UHfUR2JhKBszqEOvr8R9XwN
	IRxBNhr5G1IOrInCmAinl9qO7Lx99XAS/WrqECy2LkYjJPHkH+S3b0cAeXBw3/dkXs47WZdecrf
	bc1AkyfIFESDOhfVhPl+DT2P97EWElJlnh1BD+215jqzPcMJaoh9I5zNKpmKQle1bvSoq1x9TZU
	1cKzB1oEkU6L58KxQpa0+0bDjOqsWSAOxjMcuMCeJya7ZHtzUuNy9GpMzTwiC5qE2NrulWzTLZ5
	UzqRkYqjol3jYmFodMlv6xOpCdnxOp2B10GndosU20SaQoKQHMrWE6ryyyAQ5xM4jyH+PljJ8jb
	odBKW/kNFMAQuKhEgCi+Ap77EAeGfYXibxpR6JNxqEX9XQj+INbs5AlIcd2uhRMGR//nI+biFR7
	RVw17tMzjgZpfZrBqaUKCtZhQTLO/Ov3omsAaG9dffvltTIG4XvSjAzvX5sJNCIdL60f+hJWuJ+
	Gem978UsXKFBzoFYUEWQxkvHL7LPEG44mDPkaxIv2ES+rvHoOquzNM3OkHYPmloRMdZc12CEPId
	w9GhNAxB4HOeSg5I=
X-Received: by 2002:a05:600c:6288:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4b6e063f189mr100513395e9.35.1794075738073;
        Sat, 07 Nov 2026 10:22:18 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:17 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:35 +0100
Subject: [PATCH v2 5/6] firmware: raspberrypi: Document memory barriers in
 property list path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v2-5-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
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
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xVj2xkyPVT5nXwKtxjSn3VGbitptwgZjFMG
 flgoMHF3+mJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z8ckD/9/14C3WyvvP5/nFvlvavHAesDmGwgScVhZPxVwkTIbluUS86Yfcgvxe6e7LwCFBZdihey
 I6Avezu5N0XeO7niGu+YE0T8ciIn5KMas2xS+3jPjezE5aRZC6z9KNhTvQTK/y7jZTYOBcJ1IsG
 40iS7x3HiUKf68mLXn/q6iE78wc5QJsMvkMtlY4AY2XdtEMtVRwHE6bu5O9yxPWRQayDtPb2aIj
 sW8lOnzdzEF1D5TdMNgF9tWn2cK0JN/6i1RTmHBCAg/bVsqSkF43vJ7lO9VtQDRTnXwBWcJLzvB
 /PMsuc4wZvz/QT5CiDdN+VW7SxVHk2L7QMPxrIvl4+V3tYwsx1L7ifnJUemdBl+AcE91CSmG0Ks
 /l7XFCebwzC+A5noVmk5Cxeyos4iuTiS87gRWxPeoaefhCNlhv3G/BIempfih8pdhUYg4QJpHfR
 shk/G7kOijA4ZzPd7vCRjWdL8rwAkVBb3S4gtp5eYoCdhYDBYIGn3JP2Dxmj+iRL5WevBdXrx9T
 YPJafQgmGaIhPdS8fkbWPRP0gFOukJsKC/8/JcgNv3AsqPniL9upuugB5zdpgn2gkSzgpM14XEU
 ZnJv1dDzBzrTLfto/OFKf2uq1rLHf9t74YFfG/P8L6RrzTwMjE2z1S9RQbGvGBP01KN9Je9PHn/
 N3AK3uQijVtHijQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_102219_970569_6E5E84F9 
X-CRM114-Status: GOOD (  10.61  )
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


