Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABF4606A884
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 21:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d2ziT72F;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSFRAyX9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EaGxXuKjbqWsjiNJFFTn53rRjYcJvhNf+ZE9bk47lFk=; b=d2ziT72FqnwMmj7C5Jwvj4AqOG
	jROWRxlzSvJWpSD8q/7ylslE5Q+crm6nki6egCNw+CzdZFXU32nPCpC2MKtX4CzrtMEzRYjbaUMBG
	INnGavV+IBCOrIc2+cZ6a/xehyVZ+pbrp35iozi0faFjM9iXW0jb3ZTFi241gSCMUz4yLp+3gCDEH
	+AkF7eoYFbN22nypZdiye4WzkJEBnLW2jpHA5MUDWwqjsvzae+76L1JP9UxJNPkYHwiVca+iV6jBS
	29xbKyluq0Pi4EZhOOpKPBscGn+0HgJL6q4SdB4rN26qTvEpcVuSkCLqe526QWQ8stnkSWzh++kK9
	ZWb6uuog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRcUr-0000000B7KQ-2aEW;
	Thu, 12 Nov 2026 21:38:17 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRcUo-0000000B7JM-0Okv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 21:38:16 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6f8a519e215so480976eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 13:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794519493; x=1795124293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaGxXuKjbqWsjiNJFFTn53rRjYcJvhNf+ZE9bk47lFk=;
        b=KSFRAyX9JMwAXnLiyytR20s94wXqhX/H6yquBKrTa6i8N8UtQb2OOmDYl5X3btQIzP
         6y7hqzdFD+ftTKY7IzSpB7M60CHeV5N2srx3uGHbzaOokiY8fM52PMiIusFBxeiQyvRf
         CqwC7tOsnLD6SElsusp4f96eKdYpjGaSkTYMAH9vXaBvsH88n1U21tvFsm75JKyTGixU
         eghOfWf7LYpk4UgcrEgtRzVEdXyIyl91ep4uXmT/LxI+v311tN67EwQ6o2WT1TbzUuuC
         i3/UqIhOc0o90GBeVRzNZ3VFgjSVNEvsh60pKB/Pdnky2Z/nRFPTZuhMFIMEJEPMO5Bb
         +3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519493; x=1795124293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaGxXuKjbqWsjiNJFFTn53rRjYcJvhNf+ZE9bk47lFk=;
        b=cXPebhkwBDAvchMN509+YFY4G3CSU0lRYtHX5HZOXmjMpPcjE165nQVTHABLgEUSpB
         4sAeWggvRpup/bOVvc8EgQo6v/slvZsqvhrRpBvisHPM9UALPbJQ4pUg4dl1ZM6bHhKk
         N3NGI315RyFXfqNKJLdBGAraiCWfxyknnnOd2gwbCZHttdfhDwzWIdvVj3Wg0lMcr1BE
         ka6SOxqRlryq5RzLL36osCgucIgRJuNiXOqZ/iSGQDg4bY/qp8bTsk4GIVvNsjIhWlbz
         tfXMbMUz5XYbVsh4vAuy4EaEqiWGVJULRBdjJUfWw7WHdXWzxSv+S6y4J6mhlItSwpcr
         cu9g==
X-Forwarded-Encrypted: i=1; AL+hErEd1iX4cadEXUxBiFt8JjiP9Y7r/+G+i1EfGlZPnN5fXCT3NoXQmbt2EfJGYjl0g2H2EWtupID7sna5zmYe5x4M@lists.infradead.org
X-Gm-Message-State: APuU4Z+wYpj0MaHJaRie6pt7rpGY6C4hlCa2KKW8mWrYhi4aYzqRR96F
	YjpKtpCi21o3GwFS3KTfkORQmjdhO180wBDuH4I6xoIUzS68rMnNP2/8
X-Gm-Gg: AYBFou0278Cynnr4I3oYBYb1v9cLxe0k9A2W7VJT/kDBeMEuLJScHVVRva9kfMXMMMa
	zlWsSbW3cdXIBW/Oq+AlbcwkOJsXczqUlKTdQUjjj+jPmGdXyIkGnVi/qFskp0C3iV4hrCeWrA0
	lUT2WMkp9dnY+xBMNbcZ1fz4lEsowCoo0OVybOrK6Pd9NRcEefAATyRfWTkWxDWK8VnLeK0/EQY
	AVt1NzaNPINBpLK6CVhCtoGAqADvOvBA6qoSLLJGDIMfK4o2Ub0jIzsRqaNNI9cQ7zwBH6hR5zX
	p9n1XzrPT2BZS9rFukgLesVGuDwuS81d1KHL8oC2+jUbSUxyC4Kwalcp+Fnl+3ggOqvoQI86EKU
	tXAUhwaG5IfI3ZBfbY7boPtgCQJygqKSrBfEKhi0iEcThzIHMMRGiP0A6PPZ1V+ydFKsh9QfUN0
	Q6SRFyIG3eYgJHqgkij/IuVy2p8oxUyCY2/iko9z1DMhzoUzazo6aO9HPzxwMXZ/X3V+aHfwkOw
	GxkT92nZGmgPoK7GhNKwqfvU441jITU01GluTHt4kQx9sZRcIRCFt7EgC2fikd3nh8vuSSYAQA4
	Y8dAOeFjK7e7Jz9cloNahCJrOUap31qaUuQQd05cATkVH77oC2yXgzLnhBDVrwgLhxFwqUqnKKv
	S1i2T
X-Received: by 2002:a05:6820:f02d:b0:6d3:abd1:9b8e with SMTP id 006d021491bc7-7197cf224d0mr2811908eaf.52.1794519492651;
        Thu, 12 Nov 2026 13:38:12 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe229b9d1sm234017fac.11.2026.11.12.13.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:38:11 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks enabled
Date: Thu, 12 Nov 2026 16:38:09 -0500
Message-ID: <20261112-a733-fwclk-v2@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_133814_181870_C0C87FF8 
X-CRM114-Status: GOOD (  10.73  )
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

The A733 PRCM's bus-r-riscv and bus-r-msgbox gates have no Linux
consumers, so unused-clock cleanup gates them. With vendor SCP firmware
running on the E902 as shipped on Cubie A7S, warm reboot then stalls.

Keep both critical until remoteproc/mailbox drivers can claim them.
This follows A523 bus-r-cpucfg in commit 1dba74abf3e2 ("clk: sunxi-ng:
Mark A523 bus-r-cpucfg clock as critical") and the temporary SCPI firmware
clock protection for Meson AXG fclk_div3 in drivers/clk/meson/axg.c.

On Cubie A7S with vendor boot0/BL31/SCP/U-Boot and without
clk_ignore_unused, warm reboot returns with both clocks critical and
stalls without them. Vinicius found either flag alone insufficient on
Cubie A7Z. Power-off, suspend, single flags on A7S, other
boards/firmware and upstream TF-A were not tested.

Link: https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes in v2:
- Drop r-timer0, bus-r-timer and bus-msgbox0: A7S warm reboot works with
  these at 0/0. Keep only the two E902/mailbox bus gates after Junhui's
  review, pending remoteproc/mailbox ownership.
- Rebase on CCU v7; its PRCM clock definitions are unchanged from v6.

v1:
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com

Base: v7.4-rc1. Depends on CCU v7 (all eight patches):
https://lore.kernel.org/r/20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech

November 12 board test: two RAM boots and warm reboot -f returns on
Cubie A7S with vendor boot0/BL31/SCP/U-Boot, without clk_ignore_unused.
Both retained clocks were 1/1; all three dropped clocks were 0/0.
The no-flag stall was observed with CCU v6 on Nov 10; PRCM code is
byte-identical in v7, where the no-flag control was not repeated.
Runtime used DT v3 and its dependencies (all four UART v2 patches),
with the PMIC identifier and pinctrl IRQ-map context adapted to the base:
https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com

 drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
index b8f6e8c6e507..f2965daba0d3 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
@@ -108,7 +108,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
 				  0);
 static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
 
-static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
+/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
+static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw,
+			 0x17c, BIT(0), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
@@ -146,8 +148,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r-riscv", r_riscv_parents, 0x2
 				  24, 2,	/* mux */
 				  BIT(31),	/* gate */
 				  0);
+/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
 static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
-			 0x21c, BIT(0), 0);
+			 0x21c, BIT(0), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_apb0_clk.common.hw,
 			 0x21c, BIT(1), 0);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


