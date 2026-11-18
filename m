Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C77E60A380B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bAry1iwG;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ez0Qk31S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CEm9dGLjcVwIMaOu+kqX5t+aM+qvinbpRnz4RyrHHjY=; b=bAry1iwGdrSo7i
	lggEWAUtjq8sYA+vhF8gGS0DP63+gW684WUQE/b8HLuPmwx3+0Cz6SXid4OT2GaqE1TNi/wR3PlBw
	b6UsTVycb0oSbH+DFABhL5o4/frdg7K9zMjxrTrpyhVpNPQWYAfwR39ockb4zi90/ZMt7UnLWjlzP
	x+e7qpfVkCELJaE/CSXMdbRSXvOJYbY9W7r8B09kCUtF+rREkz7DmrRNA5jZU1UlCraqTduwId95c
	W3rioEP2UUZiCk7zTEdygW+f5nkIvb6wZsxmF6Axrb5cOm+yAj7AOY2uGTHxnRlkixNZz/y0hSf7y
	LR0LI6JQrqA9nAvOc3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThXI-00000009Hkb-04KH;
	Wed, 18 Nov 2026 15:25:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThXC-00000009HjS-2UD3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:25:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7FC39C4F77E;
	Wed, 18 Nov 2026 15:25:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CF7A5FFAF;
	Wed, 18 Nov 2026 15:25:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD84511BC24A1;
	Wed, 18 Nov 2026 16:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795015507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CEm9dGLjcVwIMaOu+kqX5t+aM+qvinbpRnz4RyrHHjY=;
	b=ez0Qk31S9QtS5y2slTb9afsub9oCe6bae5MiTUqJxpin2qhPa/86oOfDJEL36e+gl/hq0N
	kEnC3vQ/205ru9vEC10gYcjPTsRmnX//2rgC5Wx2FKON3+9NT/nmkCxBY3JiKRzDAdVXDe
	X1QqcVc9mq8Tj81LItHKUr3ofwCvWX+JtRYzEAhcWSCgkhrhTRrfxydmvXQ95204cpIt6K
	wPa5K1JZo6iSY2/i9QSdi1nO5hAo9BZ0jMf4fM1/dGszaXdZohsemd7ReSwIaLpNxZ2kPx
	XVhMHVqEHsmm/OVrCmCKoxpzsAw/VuzxbkvgKNQKcjKbhZzL1VqNr1rtLkFGhw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski <krzk@kernel.org>,
  devicetree@vger.kernel.org,  openbmc@lists.ozlabs.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v11 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
In-Reply-To: <179501501070.639563.9357303541273366380.b4-review@b4> (Jerome
	Brunet's message of "Wed, 18 Nov 2026 16:16:50 +0100")
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
	<179501501070.639563.9357303541273366380.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 16:24:56 +0100
Message-ID: <87o6bmgo1j.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_072520_469542_78C52D33 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jerome,

> We've had to base clk-next on v7.4-rc2 because it carries a treewide chan=
ge
> around devm_kzalloc. This was triggering a lot of conflict in linux-next.
>
> I did not look at your series yet but it does not apply cleanly on patch 3
> (maybe others too) because of the same change. Would you mind rebasing on=
 -rc2
> or clk-next please ?
>
> https://sashingci-clk.liltaz.com/builds/555/steps/3

Yeah, it broke my MTD branches as well... Mark Brown is having a fun
time noticing all the subsystem maintainers one after the other.

Yes of course, I'll rebase on -rc2.

Thanks,
Miqu=C3=A8l

