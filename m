Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E57606A883
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AcumF6fM;
	dkim=pass (2048-bit key) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=fPX/HTAT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EiwQ9+40yAXFn07zwAJTDOokEVNTIlZDDkhdTgBrFpo=; b=AcumF6fMdBRhc2
	FasaqmpFUIQiMmZzS2EVlvHDZC+k8p9rp3eo5ZjMl3CRDmSu+TWOM++nyUvjXTM2Z15akFbbvcV6U
	ye77mEJlOldrh1C6MQKz30pqnkS8ecxXljSTFGWAyL6GMYiU/wjvUqT5w7AYAh4sUbs/2N72d2Ivn
	Nkk9spMpt3mvnBcHn/1eqmR8x3EAHgnER0d8T0sY15RN8dE2d3z2VHC4XzlW3IHzcHS2K+Q4dY2HN
	zzqNzWsULQM5+wL/IC1cDChfVHGf3lWdKQ+/ghxzSESiDst8snMvXl8Lx1Ld1qfxx5ABp4Sv1I6jG
	PG9RIN/CpoVF/ZE2hGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDw5-0000000G87Z-1zjB;
	Sat, 14 Nov 2026 13:36:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDw1-0000000G84c-0Fwf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:36:50 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-492690dd5daso2136321f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 05:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794663407; x=1795268207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EiwQ9+40yAXFn07zwAJTDOokEVNTIlZDDkhdTgBrFpo=;
        b=fPX/HTATW6v6KWoa/SOiXnYGNxk/QU7D6QanyYuqqDvZ5fviHlngLLAy8TKDdV14pK
         esWZJBQ2GzMU6qzlKIWikZg4pDTWi2DBfxS09oXm/gOYkUJpJYa0rM0oFVh2k/TZ9eIZ
         bpgiu79Ja7uKNhkDoE6YYXJjYTJpAJWuqlzw0z0qfxZHN3by5t01oY8hpMPOxw/VQoty
         dUrvDrfiARvtONVb1NjgXFMKKffLKGjGDZRp2J/9hWRwbN3Pd7Nhx0Enmt2Wfhw64FtW
         9HP3Zj6V32w7a3BUvs9Fs67ns5pzrdbHRMXwXTt70UxhR5WrRjENbIkiQDhxGOV1Gz+r
         kKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663407; x=1795268207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EiwQ9+40yAXFn07zwAJTDOokEVNTIlZDDkhdTgBrFpo=;
        b=I7n4tgMA15tPi0EgPCJsk/YHowFfM6PdI+i1NNyo8z08FlMpsRzkvcaVQA/9s6dAP+
         XY8eU2PD3SGoQAkdvK7JTF4A11tneilx8VIRPrrXMrbd1y/j99Mj5TK9qCQuCQUvcEBq
         HHWf4/bdFIAP9myjfYIwa28JH1ImEOyyPJqwBs1EJPDghNIuv1esb5UEMNabR9x25Nwo
         uOKv4j1sDTvhiTHsvdkW6QvIC68ItrAqoUtg/2eVfZ6byyBUYYYr/n9pEg8gzSBYFd8f
         zoLG3RolZN6obpWG8pvzkVk0d6qarNO2lIhKm4Nyd93DT6UKczX/DJDfDmjGnZHgY6fn
         sKxQ==
X-Forwarded-Encrypted: i=1; AL+hErGKwPUqLBR8pKnZFteyz0qPisKNIQdVQwAhVu1Q6EBUC+/zyVEx7WM0d/d9qfoE8Faz0Nkd3Lg4uLfm2pNTj5g7@lists.infradead.org
X-Gm-Message-State: APuU4Z8RiuyuZVfDQFmC8+id1iqN3zl/T1BSerlCidjCkRit9RCJlwnD
	VN+1WmLayuluYb8SaF2QtlmhgMUC7z6WoYcAFUCua1DUBRCL8Mh/T0BTcZA+svBUD4E=
X-Gm-Gg: AYBFou2z/tyJ7akJWPzeHpS25Ld+IqYXIDQ22mgRczu5Lkmvcxyn+1JRCCvzOEeWOwE
	3v9ZKy/+rgFMj7QWQxLG6tkTu8Kq/jb+plGeAMHCDCYI75D9W9Tl0LzScIpgQ9n68U9wS9AgnpZ
	vr0H5qR7bBjEMySUSUhDGEhTeES9OusCxVL6ej2c4TOhd5GoGAhHGYJn4WOarwJ5tahYBGQT/7y
	UW18yvjgy/IqwvlB/N7l8uGjrmFfsVnXd+YpeXPcHdomehwdgXn4zGNW1WzwEL9LMqlDGPHctXp
	kaEcKjbveTYk5xizlMCatuVlEGVNMoXL3/DG1I1Lz1A3vuoAHviC7V2StxFFhERyQ49qDKO8hO6
	mGl3OfewXKzkek38R7P9x2zGWAapYk7COELZ0HrYnO2B2tcsioytd9DJo2QkAVbFuimtSGC57JN
	6BQHe3USd2OfkFyEVLDJgcwKNwbmf1rrCKwvWKu6XjmVAo0j2TODg1sYtepnXrwXkBK0OsLEuav
	KfC2TF0Pl0zikaoh0eiNt0Pri+HMj3BR6azf/nGKeuK+oGT5M81XyNj9GcBQXBGV8fz3i78rqc3
	yvunMx3D50+dF5RObjgdsx/6DXhEKBa3hE9iYqF47+e31nkh
X-Received: by 2002:a05:6000:480e:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-49c7044c40dmr10978358f8f.23.1794663407155;
        Sat, 14 Nov 2026 05:36:47 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:1a41:5e41:61a6:f0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm6657866f8f.50.2026.11.14.05.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:36:46 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Christian Schmidbauer <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 3/3] net: stmmac: dwmac1000: stop hardware from dropping checksum-error packets
Date: Sat, 14 Nov 2026 14:36:39 +0100
Message-ID: <20261114133640.3285413-4-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114133640.3285413-1-opensource@grische.xyz>
References: <20261114133640.3285413-1-opensource@grische.xyz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_053649_131240_06E7A2DB 
X-CRM114-Status: GOOD (  21.30  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FROM_SUSPICIOUS_NTLD,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,T_PDS_OTHER_BAD_TLD,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the checksum offload engine (CoE) is enabled, the dwmac1000 MAC
silently drops any frame for which the engine detects a checksum error,
before the driver sees it.

This breaks VXLAN over IPv6 with zero UDP checksums, which RFC 6935 and
RFC 6936 allow for tunnels.

Set DMA_CONTROL_DT so that such frames are delivered instead of dropped,
as commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from
dropping checksum-error packets") did for dwmac4. CoE remains enabled,
so the driver still sees the error status and marks the skb
CHECKSUM_NONE for the stack to verify.

Set the bit only with enhanced descriptors. The normal descriptor parser
does not report a checksum-only error to the stack, so cores that use
it keep dropping such frames in hardware anyway.

Tested on an Aruba AP-325 (ipq806x-gmac-dwmac) with Rx checksum offload
on.

Link: https://lore.kernel.org/all/20250625132117.1b3264e8@kernel.org/
Link: https://github.com/freifunk-gluon/gluon/issues/3783
Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
Depends on patches 1 and 2 of this series.

v3:
- Move code comment of DMA_CONTROL_DT on the line of the define, similar
  to the original version in commit 47dd7a540b8a ("net: add support for
  STMicroelectronics Ethernet controllers.").
v2:
- Set DMA_CONTROL_DT only with enhanced descriptors. The normal
  descriptor parser does not report a checksum-only error, so cores
  with normal descriptors and Type 2 CoE keep the hardware drop.
v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h     | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 1de1f929d61c..55d9c39287f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -162,7 +162,7 @@ enum rx_tx_priority_ratio {
 /* DMA CRS Control and Status Register Mapping */
 
 /* DMA operation mode defines (start/stop tx/rx are placed in common header)*/
-/* Disable Drop TCP/IP csum error */
+#define DMA_CONTROL_DT		0x04000000	/* Disable Drop of TCP/IP csum errors */
 #define DMA_CONTROL_RSF		0x02000000	/* Receive Store and Forward */
 #define DMA_CONTROL_DFF		0x01000000	/* Disaable flushing */
 /* Threshold for Activating the FC */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index 3ac7a7949529..31d5f79ef560 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include "dwmac1000.h"
 #include "dwmac_dma.h"
+#include "stmmac.h"
 
 static void dwmac1000_dma_axi(void __iomem *ioaddr, struct stmmac_axi *axi)
 {
@@ -129,6 +130,13 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
 {
 	u32 csr6 = readl(ioaddr + DMA_CHAN_CONTROL(channel));
 
+	/* Deliver checksum-error frames only with enhanced
+	 * descriptors, because the normal descriptor parser does not
+	 * report a checksum-only error.
+	 */
+	if (priv->plat->enh_desc)
+		csr6 |= DMA_CONTROL_DT;
+
 	if (mode == SF_DMA_MODE) {
 		pr_debug("GMAC: enable RX store and forward mode\n");
 		csr6 |= DMA_CONTROL_RSF | DMA_CONTROL_DFF;
-- 
2.54.0


