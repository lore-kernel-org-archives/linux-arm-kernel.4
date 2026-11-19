Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B96606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LP8dU5LQ;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=KmXK70dR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XJ8YVJK/sKNycWi3MkxIZMW+XV37XoghNTXy23scPpw=; b=LP8dU5LQXrTVS/
	y+iWEgFVh+g5vinGn2HQQIDqLsGFbOa6ANfZSoinc8zZouatwguVmtZ9QONOW0wL5BNWLOxcJPULP
	yIpBwZ883Hxpyj8Rm8b93NQGUSA2BACBtbyy+vvxO6y9MV43NHzZQiwvoR9E6j9jZgX4p32D9vkV+
	2YgDZIaRS6p1ykxcuYI6uefOC712O4t0iLzjn0Rz3tkYiGkrpIsbS2oUsa54sanZj5wHQPKyh1LTC
	i3iMvldK13XLi4ISlPzmcURUXul/m8ie7vhnCW7SiixtRYWZX8HFsufNc9cEfO20ub8nSFTElQuNc
	PmxnJTsOz/DcBhQGAt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Ra-0000000D9Gw-3wEU;
	Thu, 19 Nov 2026 19:05:14 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7RQ-0000000D99W-3o6j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=XJ8YVJK/sKNycWi3MkxIZMW+XV37XoghNTXy23scPpw=; t=1795115104; x=1796324704; 
	b=KmXK70dRw3DuR8nS5c46hZx6KdJh/W5NnUuIejMyPisV9OF6mdWY5uaic321tY6Sxshi4nYiix8
	CmXwL+pmGSZZVhZ2iLgy5yUzUDfMk7eVD5gfeqqvjkJ8vRpzp2PsDIiZXkhelRzkfSv0nsLb5+Rrm
	Vm+HvSbooXAEYF8eadCOm+J1se5N9gjpoLLGv58mCaZ3lAWsDMxN2hXcFPpxZm1xUagXbgL1/6FZE
	EZX/u+/ePN58YwduYbHrsMY07h4HjOB6xPyeirQGrVDdruxELqwXCpy25xACG3BTx0JWK/oFjcady
	UIfybKFu42JjLTgC/MjlvVnRjcdMbbTPXtZQ==;
Date: Thu, 19 Nov 2026 20:04:50 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Roger
 Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: OMAP2+: pm34xx: add NEON wakeup dependency before
 clockdomain idle
Message-ID: <20261119200450.038bcc12@kemnade.info>
In-Reply-To: <20261113-wip-omap3-vfp-neon-mismatch-v1-1-3f6f67b25251@baylibre.com>
References: <20261113-wip-omap3-vfp-neon-mismatch-v1-1-3f6f67b25251@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_110505_630952_6ED228CA 
X-CRM114-Status: GOOD (  13.37  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 10:11:05 -0800
"Kevin Hilman (TI)" <khilman@baylibre.com> wrote:

> On OMAP3630 (BeagleBoard-xM), about one boot in three dies early when
> a context switch touches the VFP, which traps as undefined.
> 
> The VFP is unreachable because NEON is powered off while the MPU runs.
> omap3_pm_init() sets NEON's next state to OFF/RET and lets all
> clockdomains idle before it adds the NEON -> MPU wakeup dependency, so
> NEON can power down immediately and stay off until the MPU next idles.
> This was visible in pm_debug, which showed neon_pwrdm OFF:1 while
> mpu_pwrdm OFF:0.
> 

I haved played around during debugging with this:

@ -687,7 +695,17 @@ static int vfp_kmode_exception(struct pt_regs *regs, unsigned int instr)
         * rebuilding and running with CONFIG_DEBUG_ATOMIC_SLEEP enabled should
         * be helpful in localizing the problem.
         */
+       u32 access = get_copro_access();
+
+
+       WARN_ON(1);
+       if ((CPACC_FULL(10) | CPACC_FULL(11)) != (access & (CPACC_FULL(10) | CPACC_FULL(11)))) {
+               pr_err("no access to copro\n");
+               WARN_ON(1);
+               vfp_enable(NULL);
+       }
        if (fmrx(FPEXC) & FPEXC_EN)

That error comes. but the endless exception  recursion of course still comes.
I am wondering if I should submit something like that with a BUG() instead
to have some more sane error message.
So the visibile symptom is that these CPI15 bits cannot be set.

Regards,
Andreas

