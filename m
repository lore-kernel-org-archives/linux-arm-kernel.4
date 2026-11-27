Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBBA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VbZZIx44;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VlN+Etd1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kSsUCaLZ9bVQ2uOWL80HT8hcdiTZ+0aFaPaxxN/Xts4=; b=VbZZIx44Dh1p1tDbiuH4CEVt2M
	6GI57o5HKj5MrgYJcbWyKTFnB/w/t/LmmHOKbh/3jTPgxA6bvDFNO0IBmh3rGHX/qGFq+dQqwuLkY
	rZch+si8zICiAZsASXTp7rfFAaY2vclcYC78lzok1kqNBDeiqmw1VJlbOvrpXXcsFeISq1ijuvmyC
	Jvu3LmoX4voXKm5SdXq3XQfnvDFY30vFa4hOhvD5/bjTN0QzLXLG2yF9b1U9MJ/PzYA3bE/vvyqGk
	JQ03cMdAjK19TgBSX1GmKtXVMyg7SG7ieRd7i9LDAgyCqlw2vpZTGqn7tPXZpm6Vf0BBIvZ+xQlJ/
	01Dosk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv8e-0000000G91H-0l5y;
	Fri, 27 Nov 2026 12:33:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv8a-0000000G900-40M6;
	Fri, 27 Nov 2026 12:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795782790;
	bh=q166kriLKS6CORHZZDg+sMZmVP8DXDf5ky8McMb5LKQ=;
	h=From:Date:Subject:To:Cc:From;
	b=VlN+Etd18ovPPNvMaasrohQwwDwPeivz72CkqUPpOWMhp48lzZ3AIPVuYpkawS4ZV
	 FDkEjJG33Pd4R9fS5hdeANsj/rOA/UDAjR5ypxlUtfcNUT8oRYOWZTo4MagLXr/m5H
	 CB5G6P557pHATgQ7RpBNQte/kW+4vojTlxiuBHeLrqAbDbSqdH+VuV1q3rJVvigW+n
	 pBa9GKJgtqXeATywjieCeLJAjsEt15+vvUw+Tumftgiz/oeJRcQyVnnlhIHgCmUXhJ
	 1REwvNX/gdHgrv0DqX+8hU+yAxBKIGLyuOTueSyiWwlzIHjmcEY1sEYfH4bbozLZ2J
	 rJd3ednioZGzw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6253717E0311;
	Fri, 27 Nov 2026 13:33:10 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 26C7F48002C; Fri, 27 Nov 2026 13:33:10 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 13:33:05 +0100
Subject: [PATCH] i2c: rk3x: Do not sleep in atomic polling transfers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-rk3x-atomic-transfer-fix-v1-1-076c94c07241@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QrCMAyF4VcZuTZgU9nEVxEvui7dothJUmUw9
 u5Wd/kdOP8KxipscGlWUP6IyZwr3KGBOIU8MspQDXSk1jnqUB9+wVDmp0QsGrIlVkyyIPlEw8l
 Hf+5bqPeXcp3/6ettt737O8fy68G2fQGOKBRCfAAAAA==
X-Change-ID: 20261127-rk3x-atomic-transfer-fix-23f2d43c38b6
To: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa@kernel.org>, Jensen Huang <jensenhuang@friendlyarm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
 kernel@collabora.com, stable@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=q166kriLKS6CORHZZDg+sMZmVP8DXDf5ky8McMb5LKQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJeIa/V5Hl9WBHf0N1YEN/JDo1tFPLHv9zp
 XnKYs9HmM+ZR4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCXiGAAoJENju1/PI
 O/qa508QAIofKch0DG1tyORZxxxBZgFty5nwWRPb/mn+cTNBPxLktrC2smPHbRsJT3qw1S54mCW
 h9fGboJlZzeKYRXWrmjZJusbjSJjr/zz5kZL27+RXZr3udjNKIQuR6G7IOsQTlVMhT71rJ0QwjN
 VZnDaGFwKEV/Tx9laN6ufZVYFqDs9AeH2G8qy/TGdNMxefEO9Qce9RGnkspWNJded5Lbx0TiUm2
 792ALubNoFwwXNmklPGEH46gHB+/zyZRWMyYAPqx/Deev9Z8/O2bGOYfkYoxlUuvQ7GbMiPseQj
 4uLBSFcZmJgJ+FK47h7UGfLDj8YiObJXs7jaqwPcmWEnsPz+M1ETALPbDKz6k3YirUyXC8gCVnx
 LzZ8cv+oStPjlxA2QAi5gDscjaQzQygAIrdiRfC4EoemdnOjLOR7RV3pms93mnihaKy19XtUsZ9
 WfSuuPwTH0/hR2m+ZA5bmZ33l1BRkqp4Gr9N+mGm1JPUjCChyNQfzQzIRZQ4pe04vH7IfOz2zFI
 5ZKN2qcKI8dHjCEEePG7z/5QSZ6JhqNyfrQMbjoIQT4bFgDugYcKrhgOJ9ioANBo0QzFLQWKXMc
 A/efFtUsRj+QaTqgURIEbN4wyUkB1SRH8I3+4DK6q5UsOxm2RYue/ILlDUsxz2XZ6FENS0TUyBr
 p0IGtJ9CYfbv7Kqq+5UgsSw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_043313_168801_20A82A3B 
X-CRM114-Status: GOOD (  12.28  )
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

On the RK3576 Sige5 during shutdown the following trace appears on
kernels with multi-core support and lockdep enabled:

[  167.961946] WARNING: kernel/irq_work.c:296 at irq_work_sync
...
[  167.963902] Hardware name: ArmSoM Sige5 (DT)
...
[  167.972228] Call trace:
[  167.972445]  irq_work_sync+0xe8/0xf8 (P)
[  167.972796]  disable_irq+0x44/0x60
[  167.973101]  rk3x_i2c_xfer_common.isra.0+0x254/0x708
[  167.973544]  rk3x_i2c_xfer_polling+0x20/0xa0
[  167.973925]  __i2c_transfer+0x180/0x9d8
[  167.974269]  i2c_transfer+0xc4/0x180
[  167.974589]  regmap_i2c_read+0x64/0xc0
[  167.974924]  _regmap_raw_read+0x120/0x468
[  167.975283]  _regmap_bus_read+0x4c/0xa8
[  167.975626]  _regmap_read+0x6c/0x260
[  167.975945]  _regmap_update_bits+0x104/0x160
[  167.976325]  regmap_update_bits_base+0x5c/0x90
[  167.976720]  rk808_power_off+0x70/0x110
...

Avoid waiting for a handler from another CPU to finish to fix the
problem. At shutdown time this won't happen as the other CPUs are
already stopped. Apart from that disable_irq_nosync() still prevents new
invocations of the handler, which is what avoids the spinlock recursion.
A handler already running on another CPU is serialized against the poll
loop via i2c->lock.

Cc: stable@vger.kernel.org
Fixes: 19cde9c92b8d ("i2c: rk3x: fix potential spinlock recursion on poll")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/i2c/busses/i2c-rk3x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 9ec3beced9f9..a07c60ab07b4 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1096,7 +1096,7 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 			time_left = wait_event_timeout(i2c->wait, !i2c->busy,
 						       msecs_to_jiffies(WAIT_TIMEOUT));
 		} else {
-			disable_irq(i2c->irq);
+			disable_irq_nosync(i2c->irq);
 			rk3x_i2c_start(i2c);
 
 			time_left = rk3x_i2c_wait_xfer_poll(i2c);

---
base-commit: eeb63983deb23d68ddc47e5d1944a7d64acdaf22
change-id: 20261127-rk3x-atomic-transfer-fix-23f2d43c38b6

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


