Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D093C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0gpzA/3b;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AjP6ucja
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9FicCzOySM1A+YM2AG2OjdAdR1S72uaob4KtLWz/tns=; b=0gpzA/3blwYU9kCL/0Tneq5lqQ
	CtclrGRxwLJuOVcIBit+bjnbwh4HKh89mfdzcJIm3/eX0G+rfYVWiOE2/0FO9wCgwxctC4kUxISDT
	mChNo00iz295+dLMDOc8yuyqF7Bh8EM9+faHdo0MqodXKvIrmKz5K72JGGkDkqDic5VPnrwy46CMU
	d19B7sedY9mi6pGR3zlDVI8Zj1HH1Nl98zzE9+jCW8UrgGkFw70Q7/SBIZnI/R1eheGpGCqGZ854Y
	Z7aRtNHa/Ylup1ul6JitssbYrG0/k1R69KUxfuHm8xlhnt//CM9sHllpcF91wcbtvJCsZ2qM07xP9
	rf1Zb1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9RQ-00000009KS7-06jC;
	Wed, 25 Nov 2026 09:37:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Q6-00000009Jl3-0Alp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:36:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4D2543B13;
	Wed, 25 Nov 2026 09:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136801F000C4;
	Wed, 25 Nov 2026 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599365;
	bh=9FicCzOySM1A+YM2AG2OjdAdR1S72uaob4KtLWz/tns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AjP6ucjaRUjiZUxp98s57hjwgnFxVMJARXwwOViEX3wr81pPtQDq8EttAPU8Vy+JT
	 zT6n+ywZLlfUcxQirHRj7E2LX4HVYv4cSYcZ1RUSDdkIrY3QzjXXwR0TBIoVTdo0kT
	 h3IMkBimsUDR08QAXpmatAH/26QKwWk5hpAu1LgpkYiQziDwdDsF0Qq5JCNkuo06mD
	 S0zoV7LZSnpbDJHUpgcCgggfvrNQSEvW1aOqSh9pt6oIkKXsyDV3btR98A+20pizmg
	 0rYo12G0n0Efxo6iTC4HaVTfceMUYvb/f2L336hNBEOp6qeZgqcC5zWJs9n1+Y3l5K
	 pXNZKYxvB0uZA==
Date: Wed, 25 Nov 2026 09:36:02 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: vexpress: Fix SCU mapping leak in
 vexpress_smp_dt_prepare_cpus()
Message-ID: <20261125-ebony-worm-of-charisma-b4ab4f@sudeepholla>
References: <20261124155839.388319-2-oss.patchbox@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124155839.388319-2-oss.patchbox@gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 03:58:35PM +0000, Yuho Choi wrote:
> vexpress_smp_dt_prepare_cpus() maps the SCU with of_iomap() only to
> pass it to scu_enable(), and never unmaps it. scu_enable() does not
> keep the address, and nothing else in the vexpress SMP code uses the
> SCU, so the mapping is leaked. The function runs once while bringing up
> the secondary CPUs, so a single mapping is leaked at boot.
> 
> Unmap the SCU after enabling it, as hisi_enable_scu_a9() does. Also
> skip scu_enable() when of_iomap() fails, instead of passing it a NULL
> pointer.
> 

https://patch.msgid.link/20261104145446.2767924-1-sudeep.holla@kernel.org

Already queued in -next.

-- 
Regards,
Sudeep

