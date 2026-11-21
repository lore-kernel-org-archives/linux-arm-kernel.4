Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3528C606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LjBT7tAG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Km7+OJVj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H6dL6XzAMKVv4yNYKDGAgTOJst/aecV2YTBa2m0Jai0=; b=LjBT7tAGhKYnfwxCiRu0ufubtR
	k38p1vNFouBs6M73+1iHHjtnj94YDkefawcXQ/2irgvWWr+Huphj4axpLMP28eCIvm7KQVMOVzA5g
	4We1oXQQ19kLndEYyBymBOjb3S2xLfmkSy5xbEuLJonwPvpvcLsEvlfUMlLzhhtapsfmWteJbljh+
	vw9AgKbjihOR7kFHrJFDSDIJkYN1jwrSGBlEM2ed3FQMp5suFzQLW6pvutLquDgifKn0EccKZmfUv
	kGuahNKcq6Enh6UA8CnbWds0YBCAGJk2dBVRlw6ZJ5W59FUS7C/X5ztAOrC1SPwBeaHeKmmv35OcW
	b67QG2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUh3X-0000000Gyni-1rGV;
	Sat, 21 Nov 2026 09:06:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUh3V-0000000Gyna-3AXJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 09:06:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15D8844308;
	Sat, 21 Nov 2026 09:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0A31F000C4;
	Sat, 21 Nov 2026 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795252005;
	bh=H6dL6XzAMKVv4yNYKDGAgTOJst/aecV2YTBa2m0Jai0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Km7+OJVjqlWJjhhxB+m+sVOS4VxAaJo1rT7yEmeirJFPAMkgmsKR/yqnXQEYPBq1P
	 ib4JFrWFs0MeDTgnBXuw2XQqA9fTZSJJwiVSplQFSwUXv5LqsWjap7hf6fRT+qpc54
	 qz+WkXPWGNUCoTpAhsn/G+NpmjtIecNS7z7gzb9SUICaMTj61DHDAb0PvHWCjgR0y3
	 Gtb77qQ5k6aDqfTYC2tRKZlie5F5e2fSz2uSEwOWOk8vcn9djSld9nbpKfWZ2YG+3O
	 PpdvtQczrrRTukJ6NfPWpzb7kccJ438II5tvTXQrsOreXScofjwCVZ37XzwsxS6vfM
	 JPIcMpJWZ0+IQ==
Date: Sat, 21 Nov 2026 10:06:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v12 01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT
 legacy
Message-ID: <20261121-ruddy-neon-rooster-a24f5c@quoll>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
 <20261118-perso-ma35d1-upstream-clk-v12-1-bee2c8dad4e1@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-1-bee2c8dad4e1@bootlin.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 05:59:10PM +0100, Miquel Raynal wrote:
> The whole clock list is supposed to represent the clocks provided by the
> main MA35D1 clock controller. Yet, the comment at the top is wrong by
> definition: it lists both external and internal clocks, which does not
> make sense. HXT and LXT are on-board oscillators which are now correctly
> described as independent fixed clocks with their own DT node. The clock
> controller is a consumer of these nodes and a provider of all the other
> clocks listed in this file.
> 
> A look-up towards the HXT or LXT index through the clock controller is
> always wrong, yet possible (even if totally useless) with legacy DT, but
> should not be made with a recent DT describing HXT and LXT oscillators
> as individual nodes, hence mark them both legacy.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


