Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7D1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gfOBi6vT;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZinORI+m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RU+8FiOFO30i4fnk/N8zX4uZnOpIMX6KLAJ62sGXpec=; b=gfOBi6vTrrNb5KgoQW5yhaa/jl
	hP0aXGHXlycbhru8oqY55o4Zd27ktjGll/eTLyczFApNtwMeZVv+ourxvizOhpsXa/hrY0Bl+CyyC
	XsNpKQzRbRL+aIMU5kD/cOoXMTOL5aJVMpLsNVYlUlJhL4cQ6PwAvuHKqwLIIiFqERIKvaYrltEF7
	Gn1+TLYYJlZQIbuhq/z1+DYNgfqyTpNtY6IyylsqA5mFtw4Dm4lTYBVyHtBJuPCTdojjXZItsRkTi
	L76ozZnnrlTRNYByLz/+z/jsImrnWDg55oNVDMIhaqdmqyz3pQMhWbip/J/Qw18s6/ub26xskBVhN
	rK+2NQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPv4-0000000BzAe-2WN0;
	Thu, 26 Nov 2026 03:13:10 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPv1-0000000BzA5-4B1b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 03:13:09 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-380c28f9e35so7579050eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 19:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795662786; x=1796267586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RU+8FiOFO30i4fnk/N8zX4uZnOpIMX6KLAJ62sGXpec=;
        b=ZinORI+mbHmpqxgnjR9EToYVqCSEATgZq08xlWZwPDtI+huYSKZITfQmWHLkr1jABD
         0cp40S7yxYyYYzBWDApl+i4X6vCOAX1bG/NR7Ap0qRLIe4Krqu6lO0ZVVRCdij8YZGOj
         2yp32fzWWVtC6W+ZDIaBbVHQzytsSFgbITwT905JRlc742PfmOJgWOosYTmm4Zedu+Mh
         VzKuDES2q9kSzbU2p8wUDx0AjF6ct284P5kf93n7QHiibmnoe5uWiztbMHm2ayz8uI4G
         2EgEGLrgaiMuvbo/BfH06mejGffxhn0GbtEEAOj0vrfr3yApy1zblg+U9404O1Vjj2qC
         q1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662786; x=1796267586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RU+8FiOFO30i4fnk/N8zX4uZnOpIMX6KLAJ62sGXpec=;
        b=zETDWM/N2jQjscIaCxNdS3Ow+am5q7SykoWRQ+7VBfwVNba+y8B8LmRKU2+C7cJawJ
         Utrf4Zw3Ofrf5tgNpITTVgDAnXi7T0zDg/hsF0ElzcP6cmVnIUGz+7bLIR8hdpKRPGvj
         3pIcg8/RbAKaXLQx7YQQUqICUxtpVpTKVErIsxlAiiHWjSQwEAmvDnwQxcN4BlbFpHk+
         7RekfC0DnHuOkik5URY9SWpvZ0kOcvfvBUXIB1hHOasHZVT0MvFjrPCNXzM/0RRon7Rt
         s4fYUgkHtPV1sbKV9UUnYXVwKNX0xiTit5mLZmpoMPMJx7EPLBLJwOXWtqRm3JGZGP7U
         2FHg==
X-Forwarded-Encrypted: i=1; AL+hErFIXUaFuygwFXXEj4GysJRAL+5XbiJWgbO9VDFNgSiS5Vs5YSp5GNlkiI6F1wmaC1oqupluca2RmNhnBaJ44GL1@lists.infradead.org
X-Gm-Message-State: APuU4Z8H4y/AQ5VfeaTSHXZ/OhnQZr3zeRYi8QMlI5Mwma5DvnqQqBBH
	F/cBqviaKyKOhlC67+9brrrfHrpybhAfL16SL0KcyItjeZT4mJ71V60KdCXuXgzSkQ==
X-Gm-Gg: AZFdTZfBCV1/rpbfxmWUG41AR/7fbrhez0stqN7sN3+3WCgEeUJAi6rIXyOqC7Gn9NT
	PC1JJ8K4K0WV6D5Wq6liLAFtlcwJ29XwPU3TIys7KSqJl9BjepW8hBVemRn4H7oh6/qzYevdtZe
	9mHYQKKivAA0hCoHPQiswJVnoWy7fp7qAag+MHG/mw1st4eL7u+s4Hd77OS1HBpIpnqE5Y7yrQx
	V8LyPSfRk37uZsz6fDxQu7NLrfdFiISfe/y4kyjjr3TsUxkYBxUB3BNuVbrRW0eRqvH+zv1FOkh
	Dk3zJ+hg51ml+J4MCpxx4Jh5c0kVziAUnBvsTxBvrxPJ7HOXTiObGXjNJ+k2syAFhu5+wQ0wTvF
	zQDrB/a9T/kBr0t9Iozu6jXTxDaiMTTJ2o0qldJ9ZHRx80GURiM0UpD9H4t1JsjxUksFag7cAHe
	VH89kfuDzXd+WBA6xFIlFSx2uIuWjFKpnDx1woHQBFC8ik41JSgljlJvK/4DjoB/ne8PkxhdwEe
	XoEb6rZqUyY7wXwPuLCWtolbOw+M6RAP/8yh+jRBo+kXkLOP9E2d98vZbS2Kv0BsQuVPrn2EOaK
	xAPPIzC+JKSFkgcWb3VWVcNKR9aRRELDlE2jEpjXMj/IflSaqXpbnx4oxJdH53+OPfMV9X06jQh
	XMDCGK/kGRZ8pHJ1DCw==
X-Received: by 2002:a05:7301:3c0b:b0:386:d466:51f1 with SMTP id 5a478bee46e88-386db4e2b51mr2270203eec.4.1795662786330;
        Wed, 25 Nov 2026 19:13:06 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm70204355eec.4.2026.11.25.19.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:13:05 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Alexandra=20=C3=98stermark?= <alex.cramt@gmail.com>
Subject: [PATCH net] net: stmmac: dwmac-socfpga: disable split header on Agilex 5
Date: Thu, 26 Nov 2026 10:13:00 +0700
Message-ID: <20261126031300.211248-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_191308_133208_BC5D6739 
X-CRM114-Status: GOOD (  11.69  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Agilex 5, received IPv4 fragments are corrupted when RX checksum
offload is on.

This was observed as corrupted downloads on a Terasic DE25-Nano over
a PPPoE connection with TCP MSS not clamped. It can be reproduced by
running ping -s 2000 to another host on the LAN: ping reports every
reply as corrupted.

Agilex 5 has an XGMAC core, and stmmac turns split header on whenever
RX checksum offload is on.

Set STMMAC_FLAG_SPH_DISABLE for Agilex 5. Other glue drivers set this
flag already. The same failure with fragmented ping is described in
commit 47f753c1108e ("net: stmmac: disable Split Header (SPH) for Intel
platforms"), which noted that according to the DesignWare Ethernet
QoS (not XGMAC) datasheet, split header is not supported for IPv4
fragments.

With the flag set, fragments are received intact.

Fixes: 93d46ea3e984 ("net: stmmac: socfpga: Agilex5 EMAC platform configuration")
Cc: stable@vger.kernel.org
Signed-off-by: James Clark <jjc@jclark.com>
---
I used an LLM coding assistant to help prepare this patch.

 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 3a89c4da2af5..28ffa5ad12d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -578,6 +578,9 @@ static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
 	/* Enable TSO */
 	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 
+	/* Disable split header */
+	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
+
 	/* Enable TBS */
 	switch (plat_dat->tx_queues_to_use) {
 	case 8:
-- 
2.56.1


