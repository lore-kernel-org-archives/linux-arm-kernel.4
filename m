Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17362606D837
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YbYjZ3SA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8SftCB8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZB33fDrAm2+MTpVzqHevrVjMtTfx0w/Sxjvwb8uQmek=; b=YbYjZ3SA3WTRAFWkEJpO5JmD1v
	Zy4vbV4Mo79otBUllfxMfAOcFbpbYaZpN9yY9ZiUz3Ace6QvIh152dM5fnhlDOjr6eeMrXlSUhSRY
	SdTA1+BY++9eB3YjN8fYsFM9qaXN0sEX1+9+v5EcdzbE//4QP4b5lNAiiziTY0CkLGPZ/uI+4qOBM
	BlD1eEGQTi08G9gUQvZCAUzwXVe8YkH8nMtjWUcNnfYRDp7pT9MLk/Nu9F+CaYUOyPM/fn5cHGQH0
	2ZXfeFr47xxRA/OJEahMF6svFvYdpbk1579vYfKZ5GwQQDL+dVP/Qii5GkfssBapUYKepkCbcwBxD
	UtwBDtkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPga-00000000s3r-3axJ;
	Mon, 09 Nov 2026 13:45:24 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPgY-00000000s2w-1DJd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:45:23 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cd69954c755so538703a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231921; x=1794836721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZB33fDrAm2+MTpVzqHevrVjMtTfx0w/Sxjvwb8uQmek=;
        b=Y8SftCB8nZV4GiLJWkYY3HXgYHgzJ8lne5K+T2YfbDXhDlNUxO4TAGfsE4e62cC+Y3
         tsJd8RFhvyRewYlxQPgbEbQivEPYO9qVgCOh2J13DA4XwM8mxABlF9NRDo2CBc3Zse0P
         Uv/4xYpJjeJI+5MOZAjYsE9jPnOHKHNDEsuFo1SwljYaSq/vQPUJ/bg7vxhrfF9sQbcV
         FETmVptLnErZLLJMBQf5+oLX+EgbjNoSIbVTBGy/0Dp4qen5oXElr5nC9/uFNSWfx99P
         xAqiqIzVS1MpWapPiokiuz6J1A2hMCu2c/YwUYk5UFEOZ6bWvXIDsqake9XRjFFz/6vs
         ZtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231921; x=1794836721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZB33fDrAm2+MTpVzqHevrVjMtTfx0w/Sxjvwb8uQmek=;
        b=EHEgqVgN+mgJfXBD/fAOo8KvlKCeEXFY7LALMm9iJN0/+Ypr1E7erDRQhvv6qCR2nM
         ExLdI2HLs2jGM1ojjpoiVHKAfOTud0qIRyNf0RApmoSMuLDRomh8KU1NSnpFSShVhnmM
         FbDXWQEec1uleTlqGF5uFGAjVbkvOjVxTHGI3oyT1oF9Zh5R/QxVQzCcL0QzOCwLthm3
         qGnwK0hp2SJeNGipKd4a656ILhO6USRFf6HC8f4T6uZwP1VACFXOpTkVBupBtR6GT3/L
         gm6Yj87rfs9z0KHt8MAC4HfYIlidAidv/7ZuPuel9BFsp1vxshorRz1B/yCkyUKwZQsL
         j+Uw==
X-Forwarded-Encrypted: i=1; AL+hErFoYr9bHMIKx8D85L39o3H1JcwNemqrrHFVWeUzZTTpKjGDLhGQ6WLCP5863qhJ+Ix+uUsI+f0QTR5SCrkkigib@lists.infradead.org
X-Gm-Message-State: APuU4Z+f4jIMiUqwn2qH08O16PLHnicAOCqniIE48WoOg4L6VQZGa2Tl
	5r85+uoKUtpGtTBK49VYTiszGSAxwmzwEHvhCGo5rNP1dVcZNdwkWa5P
X-Gm-Gg: AYBFou07bqnUaBrvdoEFJKKW5NJ47hVlHSfnnoIIps9PRd57+2sU1OdG87ryotiP49o
	61TD4a7RTu4snd2+tTjgykjR8RBJnMuLvkwoPF/0/I8Sv/3wgk9Qx/hT10g+gxzKNurbu/KQtEK
	EzO+3BW9WW5CnqM+bEX5ApyI4Rxwd1LJBzCuSjJpRX2nXxAc+jTvoz1Bb1S9EtNx3nyGK0t9zBO
	VnS6h4fQ2mPrQ770IbHrae5F3mX+yXriUZtVO5tXeYA298cxc6EcHi+IMdfP2tUG6VfU6+9LPvd
	TtvvnUtrlz1vT1+6VxuznlxkLAKjN6/RW7Om26U8kQN5Ab16mk6JKPTIFwpJH4sRlEAOvHZT1jl
	I5QVuljjCjBwEc8XMcT+gWMYiqNJ9exGC+Jsgk2pvCX4Fvb9ArH4ymnfdEynXN2l+MFIekasZ8R
	gU5x5CU2btku3eWOdjAKhBaA/slqIC7rWl3/yly52+8jXU99GQqi+VT/TG4FiFV5eQVvZnhf3AR
	6bSJMoKML0Ia3n/mvWYW6mNH4skxnL4T9mcxS8OPGG+hH1oGIpD4uSfRpMd3oDoeqEfXDBUqn6k
	tuYkx8v9DdKvhWY0YGJYoDeXg+Xs
X-Received: by 2002:a17:902:f710:b0:2ed:1b02:f6f2 with SMTP id d9443c01a7336-2ed833ee3abmr40925505ad.6.1794231920747;
        Mon, 09 Nov 2026 05:45:20 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81727f9bsm11014285ad.57.2026.11.09.05.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:45:20 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	rmk+kernel@armlinux.org.uk,
	o.rempel@pengutronix.de,
	wojciech.drewek@intel.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v10 0/3] net: stmmac: dwxgmac2: timestamp interrupt support + Agilex5 fix
Date: Mon,  9 Nov 2026 21:45:03 +0800
Message-Id: <20261109134506.2794160-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_054522_336706_07F75454 
X-CRM114-Status: GOOD (  11.85  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds auxiliary snapshot (EXTTS) interrupt support to
DWXGMAC2/DWXLGMAC2, fixes a stale TSIS race on the Agilex5
cross-timestamp path that the new handler would otherwise expose, and
guards the shared aux snapshot handler against a zero channel mask.

Patch 1 makes smtg_crosststamp() complete on the persistent ATSNS
count instead of the transient TSIS bit, waits for the FIFO clear to
complete, and holds aux_ts_lock across the whole trigger/poll/drain
sequence so a concurrent EXTTS request cannot flush the snapshot FIFO
mid-flight.

Patch 2 guards the shared aux snapshot handler against a zero channel
mask: ilog2() is applied to the mask without a zero check, and
ilog2(0) yields an out-of-range event index that ptp_clock_event()
feeds to test_bit() unchecked from hard IRQ context.

Patch 3 adds a dedicated DWXGMAC2 timestamp interrupt handler.  The
XGMAC hwif entries used the generic ops, whose callback read the wrong
register and whose enable mask omitted the timestamp interrupt, so the
clock advertised the aux snapshot channels but no event was ever
delivered.  XGMAC_TSIE is not enabled by default; it is armed on demand
from the EXTTS enable/disable path through a new callback, and the
handler only touches the FIFO while the interrupt is armed and while no
cross-timestamp owns it.  The interrupt is disarmed on suspend and
unregister and re-armed on resume.

The failure fixed by patch 3 was hit while bringing up auxiliary
snapshot interrupts on a local DWXGMAC2 board (not Agilex5-class):
enabling an EXTTS channel succeeded but no PTP_CLOCK_EXTTS event ever
arrived.  After the change the same board delivers EXTTS events on the
enabled channel.  The races fixed by patches 1 and 2 were found by
reviewing the code paths that this bring-up exposed; they are narrow
race windows and were not reproduced on hardware in isolation.

---

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20260902131441.322167-1-zxyan0222@gmail.com/
v5: https://lore.kernel.org/netdev/20260910081020.86227-1-zxyan0222@gmail.com/
v6: https://lore.kernel.org/netdev/20260929073553.4136336-1-zxyan0222@gmail.com/
v7: https://lore.kernel.org/netdev/20261004120526.2728564-1-zxyan0222@gmail.com/
v8: https://lore.kernel.org/netdev/20261013033207.1684328-1-zxyan0222@gmail.com/
v9: https://lore.kernel.org/netdev/20261104125030.1183146-1-zxyan0222@gmail.com/

v10:
- Rebase on net-next from 2026-11-09 (containing 7.4-rc2, which moves
  the est_lock initialisation next to the aux_ts_lock one).
- Wrap two lines that exceeded 80 columns.

-- 
2.34.1


