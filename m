Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82BC606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gwhYAFab;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nnPB7bJi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qx6anf3hBdJB8SU0X3cTGKNeyaZPKU1W0S8sS4JiQgM=; b=gwhYAFabgFEYTZR2oWAXiaHS5z
	wdiZlFb5WDPKFQeJs6eYV3dzBtwwzJ0rl+31bXuAytT9yltMYX54bwDmCVqqFnKgY3s0YHgn26jo7
	ZfvfKxKcLfMaK0e2Y+jqUPnTl3yw8NqBCRp/aZN9QJUcxEKf1RIbsVcWnKd5YMtbzanZkPjZ83W73
	fT4EcJIig0JNFvsVYtB42ydXIso1EZiF8HZ3lj7NA8yzcJYzXdvdUSV2aHV4dqMyPU9rHik/nz9Ej
	5Q9lO98gAfcYCy635p4JoeC9ic7880w4G5ZJGkpjpE3HoZFxj9JvorB/N5lizXgKgriVilIMAhxTh
	suLVklcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmy2-0000000C8zb-2Xfr;
	Fri, 13 Nov 2026 08:49:06 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmxz-0000000C8z9-3XvZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:49:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2edd50e36f2so4385395ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559742; x=1795164542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qx6anf3hBdJB8SU0X3cTGKNeyaZPKU1W0S8sS4JiQgM=;
        b=nnPB7bJiklS1FgqujTxs18i6XZONvL04P5c8xg2fKq10XWaXKDy1HboDci/Ioc/KGB
         AU0/AcRxWr7/AyMWPL3EobBFqBo56Ab7e9XsRK0XZzImDtpOqjNtt1DMrsjlyLs6gpQG
         arbiQCs/VAfi2vmSd0f70rBehsJEDv/Bj5hrsmE6DQFSciMu3+NTCuZsyuKyzDLm7bq2
         svr303gyk2RNtZkgTNEAbp/f5x16EPPmK4+KDuiXT0u2VfxuIgNfAXLXss6/ozjZHi/5
         S3K/BRzul1RbtAN4FRuQmT31jxuSSBTOY0t68xogDtJwIasBxeLswX2cxCipQbp6loEK
         68cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559742; x=1795164542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qx6anf3hBdJB8SU0X3cTGKNeyaZPKU1W0S8sS4JiQgM=;
        b=WopmplRAVYftPvaFtkxq2Yqw4moSN2VwxHZnShvH+fUR0ifb1wK2ON/76Waw1m0glc
         RU8/focfJXGd41B6O/gSJqlVklmytFOalobysfvy+yBQw5Agw/4sDnw+GYoLjCcCvXPL
         c+5V3Zt0VHbVby3+txTo1sKqDmHWck5Eo81O452nw4uweWIYvPaLHoPYwVJ/Kh+jik5G
         7fXmPzr4w45UU7i+9bmzhqK21uBaqNDRKfhOsUxu1shIi/+aewWVhvSBU2bNQA7tRisK
         wr/etWzEV8joanJmgQ4KMKLkHTH8oDwUIREhmRyzRYutYuuZxaYxHllnjkR4Nr0I+1oy
         wA+Q==
X-Forwarded-Encrypted: i=1; AL+hErH7Ku9CT/cO1OmjEYe4yTs4b2RN4P69ynqW5A1ZAhMdEc191dJLjCbCLyQxqkXVduz6+nkJAEC9oDBAp68q593W@lists.infradead.org
X-Gm-Message-State: APuU4Z+wZyBvCGYSYGjMTYs+/Smg3bY5Y4eTHTMLIchrAmAJ0GWGOsyt
	fFVDtJMSp35201V6AybfMNW5uf4PU+te0fGCMu1JV5cy/cOhBKnXWLQ7
X-Gm-Gg: AYBFou0sxJa1BgqNNTcVfyu/Teud++oN2yhAAlrihEF+zZ95P86iJLHzzCv7eWJzF9D
	7h8D2Tj2t802GqyiPiPsNxNkSABaBNR/sFGK9GHOWyX8WBAr+NReLMkwQEYGBy6LdSqxDnWNPQN
	phAALdnl9Yrl/wfnptInD0GPDNCQM9DZExHzFVpgC4xybXWWbwjqvkIGCtgtp6KWFjpzv/SKkPa
	xqN4eXPldcbzeDjWNc1nsY13QgNagAI392OWmZzRaECCJAjxigDbZWyQjF+ADocWoDdixDPHihd
	MMKZ2GyokuW4fDBdL+OUg5tDP8V1vI164n8CMpQRLMMCjfv1K0mE0Ohy2nk95Qj4EG+eP1dARZQ
	CWdwVju6am+p7MV46ddYuIshEvHbsW9EhNLyFzF2rR4VGQahKbaMs2kyTP/mrZ+2FYwTIYRrT1t
	eGgMdXMQlUVtyYANZ2fsISq8dsTNCyKOTlwF6j6F3/uazWyUXuDUu4qrJR/9frRYm/BEjsDzuql
	WyyWjJscsg+Ve79wUOsDaPIlhxp6H51w8U0t+iJuviGrORjsjBkEANK1yPmLXZJwIckavavaLce
	0PJzi3qLpzV/jYgkHCSJ1dnrzshmUBZk1Rv+yOo/ystjf0Vb+PdmVuP2oN8sgci7XYXcpPjgZMh
	aZvhw
X-Received: by 2002:a05:6a20:a11c:b0:3e0:eae8:7525 with SMTP id adf61e73a8af0-3f7a8bd20camr1630922637.64.1794559742523;
        Fri, 13 Nov 2026 00:49:02 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcce76sm742540b3a.5.2026.11.13.00.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:49:02 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add Nuvoton MA35D1 keypad controller support
Date: Fri, 13 Nov 2026 16:48:50 +0800
Message-ID: <20261113084852.32727-1-fyhsueh4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_004903_941981_11AE3EC6 
X-CRM114-Status: GOOD (  11.67  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Nuvoton MA35D1 SoC provides a hardware matrix keypad
controller supporting up to eight rows and eight columns.

This series adds the Device Tree binding and input driver
for key press/release events, clock management, and system
suspend/resume support.

Tested on a Nuvoton MA35D1 board with a 4x1 keypad
configuration and a 1 MHz KPI clock using evtest.

Feng-Yi Hsueh (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad controller
  Input: keyboard: Add Nuvoton MA35D1 keypad driver

---
Changes since v1:
  - dt-bindings: add optional resets and reference input.yaml.
  - dt-bindings: fix interrupt, clock, and keymap formatting.
  - input: use guard(mutex) in suspend/resume callbacks.
  - input: rename error variables from ret to error and
    explicitly return 0 on successful resume.
  - input: remove the unnecessary linux/mod_devicetable.h include.

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  75 ++++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 407 ++++++++++++++++++
 4 files changed, 494 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.43.0


