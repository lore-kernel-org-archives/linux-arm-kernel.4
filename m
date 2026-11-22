Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B4E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 07:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LrQr7uGl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LRgF71vY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5rIXOAbRqzpNweQh5zZVLwYn2XFN8mtukNpU08cq/RI=; b=LrQr7uGlsuU7mtwTWEoD/TwOqG
	iZmwxHeiKSU2fl0IBxncPprsncTO01rqN0GNkytkZIeLuV0Sy009DzWFyzR9Q+DLiEDsx6BMZcEg4
	zaz7Y/2uty9vLaFX37bJ4pfiZ4ZOknfbxVZu9F6+6fIvdJog1MGj0NOK/u7p/kkI0zYCX4wy8qD7C
	JqpM+hzfikkVYIkuTzu634vsj8wV1ECMWFDVOkZufPEFXTrfoxWitNqfwbRsOwARIFChJVNWDIgGx
	XEoTNPfYonbRrgrCbCF1N32v1ztKryMm9ClgWfW8a6yelnZQsHzRZ6GT4X74oGIuaMP00wZfS61h3
	5UPp9RIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2HO-00000000prj-0UZr;
	Sun, 22 Nov 2026 07:46:30 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2HL-00000000pr9-2zvK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 07:46:29 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-53c156ba662so1297441b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 23:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333586; x=1795938386; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5rIXOAbRqzpNweQh5zZVLwYn2XFN8mtukNpU08cq/RI=;
        b=LRgF71vYUSA8RO/tpAud1lhhLp2PHHuGon0C2aTfmzY7RCBhsk58TTYAly/OpdCodq
         wJ7sQkoGnhyji8F3zpdGaxtMtHPdNLxDkk2ATWzTok+Aj/cNJKjlDKQdIJvt5cnPv/yu
         hRBzTrCHszvKBc5eUVwzG8dtD5ipUQInWbsqwBG5Wf048oIf1UE0kXodJc9M0t67KkYc
         T2YNXR9yxyj1VVU5R+swVjsg8Zj+J0YEVNvihs1e5mvGcRe2aOXWc1qIMlP6r/VKdOHq
         qj9d4oRrShhq+QIAYOtFKiqF5iR5Sd9iNEry84TgPisT3s95Ynqyh0wnIuy/E1ZU9K3T
         mOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333586; x=1795938386;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5rIXOAbRqzpNweQh5zZVLwYn2XFN8mtukNpU08cq/RI=;
        b=dZRP/M/GtFvmKl/C8cVouTK7/9dTadxALvbV5Mz/B3e5LoZPNgNDeUH1LdCDH1/u11
         umPYte4fd5YXHJTKL1JBQSFevkUiQV5/WanIK9z+K+RzZ1+gde8oe9jBx/NTr08Lqo6o
         AkjcqZlOha7jb9pd2IvTfen8A396CDTzTEhmkJR3U7ygVVxpkLLKJ7UCZpO4u8qURWqt
         172n1dtI4p8i9KuDCiETgkg27/Z3YR8Qrky6bqz4984wcKOwnGMckylbHJW6Fkgt/V5h
         o6bS3Bq/dYI5vqLRKyW5/UNZGI4P6Hu+e0TbQxFSvWLo7Sx4fLrToyiSMjCARehJ7w0b
         Uk/g==
X-Forwarded-Encrypted: i=1; AL+hErGNAW9IiuCTMrY0zAGxLFQrqFumZC3uYJQ9V7nD24raMgfhMq/ZASY1Rtm6Md3ExnGCdeFdmvGifnz7n0N44/5E@lists.infradead.org
X-Gm-Message-State: APuU4Z9rpJADSRZ9sXU+uPJpQz8mpDWL+xULP7AkTXs1h2qfED6lN29j
	vUUQvN3VKY9imfPxOHUarfmxJhyeNVllHoOW+c/dZCrOyC3+44McSoYN
X-Gm-Gg: AZFdTZfO6ouHZ3lBTXPVtqILDHx1yyPHhHLfN3OR7JQP5Uk8CNJcFPoOqRJXf1yp5a+
	W1vD7NARKPZJrnbpXT22sDyi/XT1BkIA+nlVQtWf/IUw1eYIw2eMwwVskxwSsseV/3dYkKFOdAh
	g0O81SVo2ncuBeebQ6hHseKJUolRdsXz2PAyF3uS+ULFnRxs+Dz74rcP+6YeXyvcukjdx8w6Jwv
	nsSmg7eEcfIb8oTkLYqkF8CEREMc+s0aT+OkSLeNxmOKgX76PZTaCqXuu5ATRmxSSpRXsAHJNaj
	NYX0EGDSADUQak0ygJmlZy+G5PbWsWnIMZxX9qX4EoKp6WQTC7U9NtPqyjzsJ6axj5ejbk6yR11
	osW4QoXT4HIhOMeolZxstT8NOQ7cdyeN00gpXAhSylyG4APfV/+dXR1Lzp1DQ/TYlC1OyUTD1Rj
	nBepw0vThIFceqBwBzkO5Jo1/SJVOi/oI3oWZH+ZGRzqVWMkwHdHgOVQZtd+iymkVO2+mvMG5/x
	gZsZNeKCkIyZZgUMAmhWy++ldQ74dohMfigFF2mFZjTJbcE79+BLL4KVRtYxj60Dr2Tcn1kb3VM
	vgmap8YGGFovjuWEVMolJnAJKSLbCJlmnhdHgnha+OZhFI4A/lMk3SQzINNlWUBpEyeMh3Op5pL
	/dEsgH6GoS7gzYtcNsh5yte2SuWKvl7RH4FoNTDWU1L16C6U98h02PTD5phMaZGzLzy+WtALAa5
	8zAi/C6SpxFS46QYpHyUJZ1tDZLP4EF68cDzUA/7PI7MiKhTAYUSUI
X-Received: by 2002:a05:6808:6404:b0:4b9:a829:f015 with SMTP id 5614622812f47-57a0b645f11mr8031031b6e.33.1795333586557;
        Sat, 21 Nov 2026 23:46:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm6121800b6e.4.2026.11.21.23.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:46:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next 0/2] net: stmmac: support ethtool rx-all on sun8i
Date: Sun, 22 Nov 2026 00:45:45 -0700
Message-Id: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Oy27CMBBFfyWaNZY8E+NHfqVi4TiT1ggMtZ0oE
 uLfawoLxGp0NfdxblA4Ry4wdDfIvMYSL6kJ3HUQfnz6ZhGnpoEkaUQiUZbxHGs7yUaRN386iRU
 Faa1DmMlLktCy18xz3P57vyBxFYm3Cofnp1UcOdRH7cub+Xdp0/UVGH1hES7nNjR0POpJByunf
 q+UC2SUwRGtUTP2sq1K563TaoJ35KF7AqP7BBYz+7o0iAe2Q2PY9mT3zg4rweF+/wOeUeDzEgE
 AAA==
X-Change-ID: 20261122-submit-sun8i-rxall-v1-2666ccf2a020
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_234627_788005_DACE6724 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On H616 the PHY can count a bad-FCS frame even when it does not appear
in a packet capture. Enabling rx-all lets a capture see the complete
errored frames the MAC can forward. On this hardware, a 64-byte frame
with a bad FCS reaches DMA, but a 63-byte one does not, even with runt
forwarding enabled. Both lengths include the FCS.

Add the common stmmac receive and feature-handling paths first, then
enable them for sun8i. This feature was previously posted alongside the
checksum fix and is now separate following Maxime's review [0].

[0] https://lore.kernel.org/r/a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com/

Assisted-by: Codex:gpt-6.2-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (2):
      net: stmmac: add common RXALL handling
      net: stmmac: dwmac-sun8i: support ethtool rx-all

 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 73 +++++++++++++----------
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 +++++++++++-----
 4 files changed, 80 insertions(+), 48 deletions(-)
---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261122-submit-sun8i-rxall-v1-2666ccf2a020
prerequisite-change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598:v2
prerequisite-patch-id: cfcd83b1605af3856aff1188ef7bdbdbfc19cce0

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


