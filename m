Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5903B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JnL4GxKH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVM8H4El
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XuNfvEy1BgM6+lq/Ggcvuq6XdX7O276tu5lC+EY67b8=; b=JnL4GxKHmcBAPD
	PHmCsEEOpy4jWgag3quefqbtt4pG1MJVxPTn0H7P27CR6pS5NuhwS0fT1KyRpqt7mHOdTMWaAU8IK
	QJbm9/1jvo2vFxgtv2zBP2twDmCE/HJ9GnoZ+YIcKoWvJao42xK6afKfaggjL8wZJR82ASx7TtGH0
	qI/EsiZc+mTbrrtPxtHGUz8ulWIfKL7i3g1wRNQgTpCFMxrTN5N565u+47KH0izC+PHZgqA+WkH5Q
	8NY7u7hGeeDgTbGFdDs2slqh62D3DhV2q9mDy2I78OAYwZ3Ys9yVlcEDmagzCUr21mDOalk4R99Cz
	vvlWSty0XSQhUNt11xEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7se-00000008xXY-1BtR;
	Wed, 25 Nov 2026 07:57:28 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7sa-00000008xWy-2eb2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:57:27 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cddc250d815so2143106a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593443; x=1796198243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XuNfvEy1BgM6+lq/Ggcvuq6XdX7O276tu5lC+EY67b8=;
        b=lVM8H4ElwQcASDYGZhixfIwCdAK9qE9vGHZvtlIH6ShFw05CQb2WRTEjVAVcbQNErr
         cEAu7BWETrWOrmXLaKFdvFXqYqopnUxmbY7u7C3sYpAh3cwDc6rah2d3WVv+W0jt9Cvg
         tz1+XtOlhgD3Qtw3kNDsHhUTqxYbBKXktphkjVX1hs/OKkDxjJSfkt9ev0qKmEhc+WFn
         eFbrbv7J0t41qIXJ7iRcUKlD2/6sfuTglPtEXdeV89FcT+iqp9mfVeu042SgDOzp/gLC
         dzJJ0ywVA7h4C9xFxFx3v9mB70SBKFRG7ipl+Zquby/2QXcrqDQb/L7gAUwyBFxVEngy
         OljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593443; x=1796198243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XuNfvEy1BgM6+lq/Ggcvuq6XdX7O276tu5lC+EY67b8=;
        b=SqghsOsGSGsFjgPyeoxvd+HstfTWzm0l41rmkBYxm1icwgiv3kt8IviwD3wTlyXXMK
         TWITXoZ+g0Vc15XLDAsp+YOEQuneeL0dojHJnJEwcWlv8FHTHeEKiArVxuU1H9y8arq6
         oANP8lzWcUkM2KN5OioqeFk7/rDmSYjSPUrb0EdUqzPdQsi2rR7RTQFLCyqDDd9hsIIv
         5HfN1fK9Rzbv1ejN/ps6GwsOX3kKoHz5FEgDnQ/dTYIxJguiLR/um9gw+58TJ+vocojA
         1PPZCBQdPk+jmNXeDZN+h32tao7zvH2AEjs2q8TjcjXLdrU6KVg8GetSmGhA3wQk0kXv
         kqFQ==
X-Forwarded-Encrypted: i=1; AL+hErGCcZ8r7LLbScIdOOBC849PWmfSfF1vPVpKHsxGVJ0gMrhEEuwXPenFWrkJv0nR3U8CqUlRdKTVZriHSBsBVrgS@lists.infradead.org
X-Gm-Message-State: APuU4Z9nzy/lToQOTUXmaJbxp1/ynsc80fR+65oOtbG+W9bUyj6SQQpc
	ENDUg0CtG8gc4jNV/TgWcOryNQ/ncruI+qpje82cV6P4g0AFpF26qHPt
X-Gm-Gg: AZFdTZf7v9nGjk1WoK4Wty1h6cU41OD4InURIfUlv8B0XFA+ADSR7kL+D14YXFVxYpj
	fLvDaMg0LnLRa35nH6l+kAHdatchvjmTPbBTnCiihBVi6csVOvVa0WYTvKSi4YHs5O6KXrm9+0o
	SjJmmlMDuFdogw+7wVY6sm3VBWHYvKEC6OggBi3otOqCZ6U5NhslEPe+8RzLDznZmaGxDAoOotD
	3a4o4e1IYRC0UmlzbEctjxVLkNSkruvzcJoAndy1WRyl8UP+V6gfHDszkMtm640BTx9l3oLHVpT
	0KoPhuu+R8LxLS2GmrGk1f0w5Mm1aacRWcota2+fvNtcO8iVL8X2+dEy/gjcJpS3FAivouBHfME
	vGmTL5Y4+jNy5FGy72rVXggkumtAeS/3NhHXw/0vao8N6NKyWr/078cfnUkwxfOMPKDnMOyDr6V
	jBK+g6pNA/qNVe7t01hMG4a/DWU09s7N99+IroaTHS65VVaWoL7jyC6S/wNWzQNt0t8d80ISJDl
	RzvQUWqq1QUYNgwv6k/S0tCd+PWPRC7psUImBGTgK9EkMuk3+oSfdCAq9lkwP3cs+qXRK3xeZ8d
	qpOaglZKC9wN8QdEKPTuggHiXvDC
X-Received: by 2002:a17:90b:5543:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3b41c8dd197mr15969724a91.11.1795593443202;
        Tue, 24 Nov 2026 23:57:23 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm28092402a91.3.2026.11.24.23.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:57:22 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: romain.gantois@bootlin.com,
	cathycai0714@gmail.com,
	avifishman70@gmail.com
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] net: stmmac: Fix the problem about interrupt storm
Date: Wed, 25 Nov 2026 15:57:16 +0800
Message-Id: <20261125075716.2262174-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7732873.EvYhyI6sBW@fw-rgant>
References: <7732873.EvYhyI6sBW@fw-rgant>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_235724_710790_A9A0A311 
X-CRM114-Status: GOOD (  11.40  )
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

Hello Romain, Cathy, Avi,

We hit exactly the interrupt-storm scenario you discussed, on a local board
running a PREEMPT_RT kernel, and I'd like to ask whether this series is
still being worked on.

Our setup and trigger:
- stmmac with dwxgmac2 (xgmac) and dwmac4 (gmac) MACs, kernel 6.18.34+
  with PREEMPT_RT and panic_on_rcu_stall.
- Trigger: fault-injection of an uncorrectable MAC safety error, which
  makes stmmac_global_err() schedule stmmac_reset_subtask(), i.e. 
  dev_close()/dev_open().

Symptom:
About 30 seconds after the injected error the board panics with an RCU
stall (rcu_preempt detected stalls, rcuc starved).

Root cause (confirmed on-board):
- The main level-triggered IRQ storms at roughly 820k irqs/sec during the
  reset window (irq count jumps from ~220k to ~23M in ~28s).
- stmmac_interrupt() returns IRQ_HANDLED without clearing any status while
  STMMAC_DOWN is set -- exactly the "unconditionally returning without
  clearing any interrupt flags" behaviour you flagged as dangerous.
- The level IRQ stays asserted -> infinite storm -> starves rcuc -> RCU
  grace period never converges -> panic.

This matches Romain's point: the unconditional early-return in the
STMMAC_DOWN state is the actual storm source, not the TMOUTEN/safety
watchdog.

Fix we validated:
disable_irq(priv->dev->irq) right after set_bit(STMMAC_DOWN, &priv->state)
in stmmac_reset_subtask(), before dev_close(). This masks the level IRQ
during the synchronize_net() window.

Results: irq count peaks at ~724 instead of ~23M.

Questions:
1. Is anyone still working on this series, or should we revive Cathy's RFC
   with the evidence above?
2. Would a patch along the lines of "disable_irq around the STMMAC_DOWN
   window" be acceptable, or do you prefer the more general approach you
   suggested -- wrapping the STMMAC_DOWN set/clear in a handler that also
   disables all interrupts?

Best regards,
Zxyan Zhu

