Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kPfSP5Qt;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=uKqIj989
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aHa4P0YtaZuvv8+v7789rnOLQIKeJc0wIhDUBtVf6zY=; b=kPfSP5QtKPwYq3
	hDEJHzPSm3m0ds+JVaTpOzoul0avEbJJ+hh+ooN0lGdaOLi8xzEgEGEeDORxZoZEnUIXBC5OS0Oem
	AQvlJfGfCLUL7yMOcKkojnm8XZvdwoKuNqBEVNfn+JnKz7n0BzYansLPUOsz1bIlU+dZeQz3I9guo
	2dO5xyJMBy8SvMfRVT5eOnT9CB7s9R9sXT7jdBOZD4z7G7QOVpRKeTa6hrCyVlhKrF7povug7M6tg
	7IEa6U8zn6JknRbeNoQy20YRMzI1hc9C6zYXXvqvhxQ5y2uRnupl0N9vnwJnNlC8dcuceghrOM3Jn
	qvu7KZBdCDa6qlLBDbAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW5P-000000041Cv-1k5I;
	Mon, 23 Nov 2026 15:36:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW57-000000040x9-0hTy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:35:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so30248335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448147; x=1796052947; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHa4P0YtaZuvv8+v7789rnOLQIKeJc0wIhDUBtVf6zY=;
        b=uKqIj989Aa7gFcb0zXD2DF60C04QiHh49g9/PG+4u63ppWZkyMOC2a6jSMFFNJCcz3
         o3x+KzjZotvwjPN3vfEsyecxhEKoulyxS0d5r5AHzCTDYNIYrx0mB3yuzg40jMM3RVlb
         SYPfINM3AFWOp6f7+VDX3IX5HPcHNpsFH1oameryDIvCv0TOB/VLIF+KbyFCGk0CUSdV
         FiJTLxXoFZs16TUW9pFCL1W9M90CGjoK6vGjzB3hN4b0TZk/SaUBV5i8s0vSLjwEniqP
         p8tQQGyYB3sd5+K7tVeQnXp5Bkpf1WAku0S/gCQeDvg7/nEx+M7jBp0j1Cl4urvo0SzG
         yw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448147; x=1796052947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHa4P0YtaZuvv8+v7789rnOLQIKeJc0wIhDUBtVf6zY=;
        b=XaPkweb9mFJRFryHnktjpdwjbgEwMt7sQ7w43b19H9yli7zdr+2jM0pVnCF+fsPzPt
         1o8Eg4Obj+umxVcPyAjf3Oqqj35+VMh9Eh0Khs+ZoBWosjarSobzFvTthkaJw2VI2HGP
         isDcwO1ufSumgvlbyK/iA0f1Jajn85+U/qhrwuAXKyGIXvX1Z2C8569bw/xwd37N8/NK
         UimlG66Be1RYP0uEtEunFxLjiezEnptYOPZojVpaWX0Y04LyjzS8/IyIDyNNIQ77Ut8n
         QqK2Vv9g6KpZCZ5IhBfrbFu/Pn4B0+NjqHKcrVd0NzHi/dz7P+SEpFqkngzPsHaDhD5z
         HcfA==
X-Forwarded-Encrypted: i=1; AL+hErFUrpmULw+UippAwAxpikSGHtq4RY0xLlSAyMB90sMhywZGiId9YXFj1sADLXIaSgvDfOb5LIn8XCYZo7ASKCFI@lists.infradead.org
X-Gm-Message-State: APuU4Z+pb+d+FeaFyi72PZb+4mgDVUHYh5nSESgz0QKKtckKxvT5SYLY
	dO0C25ZfEZzvhbpnUR8UWfBCliDbdtIThneOBmMvrJy3iSSIzXrNc4dadXdh+OaFHsg=
X-Gm-Gg: AZFdTZdE/BGqPNzJxVXh97c4FYUDZ0+ZGkQRsMkAd8NbfseoJ0kq0FU4FbeWzBqtu/f
	t4N3zofpYcrRD3me712n/Da4Bbz4YAyRQNVRavdAowYpEPSJrzcHM7IwEaasNdMep1AvvFxC/UX
	AOX7RkJb8lNhRY60I1toeDt4sjQgHkUz5IYvBMuD3BgiDRyRifFEkCBlL2SbdJzVspux2dA7n+T
	M+gQUXPSXYPJ05OCV/SNkIdP8JI6Ujs0G787GIoz9JtorslNdzZfSXf2RWH5CV6++S2LWp4040Q
	8D+bAiAJyWBQJJWHOoctejxQ/THQP8FM7AVB5I1PtJuad7wPJuP90QLFotuc2oldU2Nf47HK+wz
	aM5g0dEr071YwHoIBVU3ZDlikh0DVH9ovuzClXR+PF1FD/nx2tnukxj2vZEZR7lJlWgVxvQxGjE
	9a3MUOuF5K73McEPxk9rgmS9Iihl/LYEi6WDP4X9Y/l8xwlSW/+rMdbF72pu3pi9qysbt8HJ4RG
	DBIj2CUFXBbc0yRc6SA0h+qfN2668s79V9w9NN8i+NmyT3+iwjVn8I9xu21PQlCg4lOAvUxd1QY
	V7oiwnROAfa+LBjKSwSzgVtLqUUxQOhiXAlikxk3Z0PjTLfDnLE9rRA5051QOIdAoaJN1xxJ/9o
	6sE5XwZwWyBJCwQLOZCJ50GfkhJA4EuY=
X-Received: by 2002:a05:600c:64c6:b0:4bb:6a75:d04f with SMTP id 5b1f17b1804b1-4bb88807d96mr234285915e9.8.1795448147605;
        Mon, 23 Nov 2026 07:35:47 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:47 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:36 +0400
Subject: [PATCH v3 2/5] nvmem: core: Let read post-processing return a
 shorter length
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-2-40c756dcf36f@flipper.net>
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3605; i=alchark@flipper.net;
 h=from:subject:message-id; bh=nTVuYbBKOZbvakHzhdzTWG9sbZJz+RCYmADvGAiJs8A=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHoeiGEsNpDQ2b79kdqy2a6JKx8U5nXE+tYzXI6xP
 M0k6M7XMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSHWjD8j7pj0Gc8Q0hot/Kan0u63S6+/brq6gyxjsg2JyYvhffL4hkZvkaZS8/
 I0Tpd8L1LgX+fwrR7gSt9plo+E3fbZyMzd2cFCwA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_073549_255626_3FD1247D 
X-CRM114-Status: GOOD (  23.38  )
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

A cell can hold data from which a provider derives a shorter value for
some of its consumers, while others still need the raw cell content. A
CPU ID which serves as the base for MAC addresses is one example: the
MAC address consumer needs six bytes, whereas anyone after the ID itself
needs all of it. The post-processing hook has no way to express that,
as the reported length is always the full cell size, and consumers such
as of_get_mac_address() reject anything but the exact length they
expect.

Let the hook return the shortened length of its output instead of 0,
and zero the buffer beyond it, so that a caller ignoring the reported
length sees no leftovers of the raw cell. Reject a length beyond the
cell size as a bug in the hook. Every existing hook returns 0 on
success, so their behaviour does not change. Clamp the sysfs cell
attribute read to the reported length, as it can now be shorter than
the attribute size.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/nvmem/core.c           | 17 ++++++++++++++---
 include/linux/nvmem-provider.h |  8 +++++++-
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index d976c0d6603b..dde77f78e109 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -384,7 +384,8 @@ static ssize_t nvmem_cell_attr_read(struct file *filp, struct kobject *kobj,
 		goto destroy_cell;
 	}
 
-	read_len = min_t(unsigned int, cell_sz - pos, count);
+	/* Post-processing may have left less data than the attribute size */
+	read_len = pos < cell_sz ? min_t(size_t, cell_sz - pos, count) : 0;
 	memcpy(buf, content + pos, read_len);
 	kfree(content);
 
@@ -1647,6 +1648,7 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 			     struct nvmem_cell_entry *cell,
 			     void *buf, size_t *len, const char *id, int index)
 {
+	size_t out_len = cell->bytes;
 	int rc;
 
 	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
@@ -1661,12 +1663,21 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 	if (cell->read_post_process) {
 		rc = cell->read_post_process(cell->priv, id, index,
 					     cell->offset, buf, cell->raw_len);
-		if (rc)
+		if (rc < 0)
 			return rc;
+
+		/* The post-processor may have shrunk the data: drop the rest */
+		if (rc > 0) {
+			if (WARN_ON_ONCE(rc > cell->bytes))
+				return -EINVAL;
+
+			out_len = rc;
+			memset(buf + out_len, 0, cell->bytes - out_len);
+		}
 	}
 
 	if (len)
-		*len = cell->bytes;
+		*len = out_len;
 
 	return 0;
 }
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..a95529aa3e80 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -20,7 +20,13 @@ typedef int (*nvmem_reg_read_t)(void *priv, unsigned int offset,
 				void *val, size_t bytes);
 typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
 				 void *val, size_t bytes);
-/* used for vendor specific post processing of cell data */
+/*
+ * Used for vendor specific post processing of cell data. Returns 0 if the
+ * data keeps the cell size (the cell's bytes, not the raw length passed in),
+ * the length of the processed data if it ends up shorter (1 up to the cell
+ * size), or a negative error code. The core zeroes the buffer beyond a
+ * shortened length. An empty result cannot be reported.
+ */
 typedef int (*nvmem_cell_post_process_t)(void *priv, const char *id, int index,
 					 unsigned int offset, void *buf,
 					 size_t bytes);

-- 
2.56.0


