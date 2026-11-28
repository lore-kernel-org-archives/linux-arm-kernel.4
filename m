Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB83606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 04:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EHVS1V5n;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=adBHKwIo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N6cwWO2g0D5Z9VuuT1Npo2iJj2ZV4U5twK2MRGeEqAQ=; b=EHVS1V5n+EISV5
	F+hKTcLfFoSQSOAtKItzTfOWBacsm6WeKsyURhI+zUKVC1N4RG5ThH9RQO2prNY1zbNfeoZj3Hkjk
	l/nVgLehyPmWshO0aG9R3sP7xz6wdwNbHjxpJudUVhWAg8ZCuc3HxHX1IFRP193tn8P/eP7zmh+Ds
	0R7sEbUnp9hJyLqlx9aQtqCxeSt/w6E3zVnbvIBm2Ku4S9l9922zLyIqd5ZGEELpacN7rinmvUo9M
	cHMzIbLb4i1U/kOWEfAE4+LgOYouk2ISgF4ClKwC/GS6oLNCje+5cGz3SE3VgXGZ4+Zh94QPm4Xp2
	lYSpm0kB6e24D/ylIY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXACN-00000000Np9-1Xul;
	Sat, 28 Nov 2026 04:38:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXACL-00000000Nop-0yuI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 04:38:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A732060D5C;
	Sat, 28 Nov 2026 04:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE701F000C1;
	Sat, 28 Nov 2026 04:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795840684;
	bh=N6cwWO2g0D5Z9VuuT1Npo2iJj2ZV4U5twK2MRGeEqAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=adBHKwIomaFsOK/pBShYnV8fAjOjr5zjJAqPtvyAO8bO6zpaknZz5SS8V93JMH2Rq
	 9SauAVZ80xBRbw0hST2j0x7cSPw8oL4TLJ1XVn3CJOiFobUqST9kBpbbpMxOg/cSVv
	 qANAwIBNdj7VEbAQcr3fXhdzLFeSUumvsbqH7i97BBSarbjTiJQQj8zUS87qs6uYRv
	 uGAT0QLbGfk4mA+6oRalAFZMX5gHgL/0thk+3MscnwrXmLqYwztjtp+oBig1f3dIM1
	 lPcNaHpOwO1vnnJ9Vy/x1S+pIThSu3YQt8ahsvYgKP9x5TG7V9fcuh7QGTpIE40t0N
	 uY7rOfXPGQIhA==
Date: Sat, 28 Nov 2026 04:37:56 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <git@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>, Joshua Crofts <joshua.crofts1@gmail.com>
Subject: Re: [PATCH v6 12/16] iio: adc: xilinx-xadc: Add clarifying comments
Message-ID: <20261128043756.44cb2303@jic23-hlaptop>
In-Reply-To: <20261125171045.1246381-13-dileepkumar.nagavarapu@amd.com>
References: <20261125171045.1246381-1-dileepkumar.nagavarapu@amd.com>
	<20261125171045.1246381-13-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 25 Nov 2026 22:40:26 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Add missing comments on struct mutex and spinlock_t in struct xadc
> (per checkpatch.pl), and explain the non-obvious FIFO-drain loop and
> Zynq alarm-bit reordering logic.
> 
> No functional change intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Applied patches 1-12 to the testing branch of iio.git.

Note that for next version you'll need to list the dependencies so
that sashiko can find them.  b4 can help with that if you use it
with an appropriate base - it will figure out the message IDs to
add for the patches I've picked up.

Thanks,

Jonathan

