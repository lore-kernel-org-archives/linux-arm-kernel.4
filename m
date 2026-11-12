Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D8606A88E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W775SwR+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L/uZ5F6C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=z3BbB7EvRhTQxsA7XhxXSS2tjjNrAp5pTR6enOtvXX4=; b=W775SwR+Psn8mFwVBQF7aaA+E/
	3ZMq7iJVvSet0QQycDjDNngYLFy3HChfQR2J3JxEOeuuiUc9MLkjVmWDRahrInPYngDFxHFeUqgCl
	zGzNmPwG1A5O91j4X1zCxXfoYP18a62VjuKEjSfH3zCwdbKtOmm6dzvLP3MHylPqye8g/F1djxNRV
	EF2TV0q2qinw4VYvLbbmSfozxjLCLtLt3fvB0gEl4JhQgHD2I1Ar4AiC7w/MGYdC90NwtaEm1FQx2
	BewCPWzfDy9hmBo6fhaHywbjB/u/BqK9I5o7KuEqgTrujK8dW5U6ydr/rX02qYQJehPXD820Bwlk7
	/bLsG7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWo3-0000000ASdl-0vx7;
	Thu, 12 Nov 2026 15:33:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWnz-0000000AScx-1eyp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:33:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so46735045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 07:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497617; x=1795102417; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z3BbB7EvRhTQxsA7XhxXSS2tjjNrAp5pTR6enOtvXX4=;
        b=L/uZ5F6CLQMu7Jugp3OOvhLt2kayN6/C55WT0toDuycgpE1wn5JeyhhDf0IWfp9G+R
         foFw4x1DwQ737LBP0NqqJUm4J/O9jCd7f9gmj1Km7QPJrYUJ9candJqHdXCG/WAscFS4
         IWoOv6n3wIN423wuP95cVor3G3S8+RSCys0Q9jdB9IfWq80idvOC9mUrh3SJM9A27XNn
         FqSO8H+bwgSmBrLCEepguhzN3si7sPLBv4fV2p+bq5PcZP+5rUBhvNGJlGuV94NHfLGU
         F5k5VkEZ9iKTUredutlg/Rcdm7jghyfEFsNpShUDhjEy035EsIChdHaKJLlOykWpJBoL
         E2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497617; x=1795102417;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z3BbB7EvRhTQxsA7XhxXSS2tjjNrAp5pTR6enOtvXX4=;
        b=lWeq4LvCSsXIBvnGOCJoV2OJ+BJI0GvpQCTSRzM1ITE8U/2cnQT0TTW7Ov0GwIeo1I
         70BpN8nGDstANDREeNv+pRcLl1ai2vOoeDgh8sCbGZuyPLKap88nw/Gk1k3cUgO7b8DJ
         j7eCT3kaMIn4tZGQzfrR4W0Gk7u5or1xQKyblhU4+d7M+rWjq2ez/y7LS1t0qW9+MOr5
         Se2L0SrwjezpSEq6FybUz4zPsK+JF7P2qzHc/aiefKpkfi+zsd3Do2TOku9/zWY3Qkt2
         a1/QhqtrA4QjlFVHjDDcuTXkJzGv6EKnIGUGYo+ZS1kzNlzDMti1MiiMF7deuWJH006T
         zyEA==
X-Gm-Message-State: APuU4Z/DxhANzfSH0L8njgXDUH6cMU/pJJNXHwpuhJXPZR/KD3aXifg+
	0yHbfu5tTWBmVhBNCWFz1dKYhw2CZafQ+tSv/MoX141dPc9FMpCd2Kzx
X-Gm-Gg: AYBFou3JHPTLW/MorAroYCvIt+vNkAJcXwm8U6WGjg6uFNCgJfGIrPXwCN5mIl1KoxM
	7T+TpC0rN0Ob90ZRmeAGWiB1+ZiMq7DEoGiHMM0qWtTgoDG7wMGE6g7LXdzsIz4GXGai3x0Hdui
	Wx5Kbhpshtj/MbEbWrJS5c55a9d7qSTOV+qIAFz3r7ZB+WZZxaLmeS2mz0V+2t8Pzj/j9ZMLyy2
	BPIDAdhpdduDK9JfogwTVKbFtxQf/FDx0wouCM9jet7/jeDxlUGZzEjg8/bo0h4DNHyFkMtV9bj
	ALU15wU2glAxVr2hTossrfEW66mxCpKBNl8OZWuLlVht2ZtBqet+RxS/YpF9DP8B6yso1R28UjM
	W8foeMrglyVkeuEXDiNQYoOGov1CjlJ7JfO1P+NPVUZGnMqRM0w6fN8eJy43il1K8wJUfuZZuOM
	qy/9xBaTQMlIEMpJMnRBp/j4M6eERRken2JDcJkiYcprUvxSDV8Zs/mLajvQK6RkgJX1bEL3kan
	gf0vKAKiq1Ia6BsDGeUxKoi62jSr2LzwaF9g0f8arB/Pzl6Xjo2eQ9uKgpRN2WbEkd9iHANFf4Z
	UptXLvjmzVngjM7QRVQx02x8kvvS/Oo0C+XOwaedsSM6S9rVHlrX0tL1Gry+pa75/vafFFh7ZrS
	CIuVW8g==
X-Received: by 2002:a05:600c:4f4a:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ba0939726dmr133509675e9.26.1794497616817;
        Thu, 12 Nov 2026 07:33:36 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm87105855e9.5.2026.11.12.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:33:34 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/6] serial: vt8500: Clean up the probe using devm and
 new serial core helpers
Date: Thu, 12 Nov 2026 19:33:08 +0400
Message-Id: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSw6CMBRFt0I69pm2iHxG7sMwKO0DnuGXFhoNY
 e+2uADv7CT33Lszh5bQsSrZmUVPjuYpgLwkTPdq6hDIBGaSy7sIAb8WGecQNTWAHlBN2wKm1WW
 eCjQm5yy4i8WW3ufus/6x25oX6jWOxUZPbp3t5zz2Ivb+fXgBHJo0zcqbkllb5I9uVDRc9Tyy+
 jiOL5E4i57MAAAA
X-Change-ID: 20261111-vt8500-serial-cleanup-dfc9731edd70
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926; i=alchark@gmail.com;
 h=from:subject:message-id; bh=8PpJS3y5hC3pEkcD/IutXHMoQpc5qWIJgmCmvXikxks=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9veP5PV5iUoGy76ensRUHhHWvxfbKKS60yGSMN3S0+
 yPpO0WnYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKkWSWb4K9rzrGPTod57hzf3xLrv1/JYef1olm7KDG2OshviDyY5RzH8My6PCQ3
 fvbBfNFEw8l5M7xaxBJclqx+6nl57QO/apsRwDgA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_073340_020518_38657C92 
X-CRM114-Status: GOOD (  12.51  )
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

The driver has been carrying legacy vestiges in the form of a bitmask and
a local array to track which ports should be numbered which, both of them
not really needed anymore with DT aliases and existing in-core tracking.

Remove them altogether to simplify the driver and get rid of leaks Sashiko
found. While here, also convert the clock handling to use the resource
managed API, and propagate errors from uart_add_one_port().

This hinges upon two new reusable helpers in the serial core which allow
getting the console port for a given line number per driver, and another
one to auto-assign line numbers for which drivers currently keep an
assortment of local accounting boilerplate (some with locking and leaking
issues, such as vt8500 to date).

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Added a core helper to get the console port for a given line number per driver
- Added UART_LINE_AUTO support for automatic line number assignment when no OF
  alias is provided
- Link to v1: https://patch.msgid.link/20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com

---
Alexey Charkov (6):
      serial: core: Add uart_console_port()
      serial: core: Allocate a free line for UART_LINE_AUTO ports
      serial: vt8500: Look up console ports with uart_console_port()
      serial: vt8500: Drop the port index bitmap
      serial: vt8500: Use devm_clk_get_enabled()
      serial: vt8500: Handle uart_add_one_port() failure

 drivers/tty/serial/serial_core.c   | 89 +++++++++++++++++++++++++++++++++++++-
 drivers/tty/serial/vt8500_serial.c | 89 +++++++++-----------------------------
 include/linux/serial_core.h        |  5 +++
 3 files changed, 112 insertions(+), 71 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-vt8500-serial-cleanup-dfc9731edd70

Best regards,
--  
Alexey Charkov <alchark@gmail.com>


