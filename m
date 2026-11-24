Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D3D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EZq0sFNW;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VX3JpSiO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DkZ1ABuSs0XqFw9KTioPWKhCAj31GhHamAleqCJ6xL4=; b=EZq0sFNWwFdNPmZx/+MWtR0Gky
	AkT6A+w36mRYwwtW+7zWdTnbNPy9b3O8wD1NcH2mbv7BwkgDPOJCPculqR5pF+uupp5K78qD6daiq
	QYb2xzICVMRylxagueknBYNbd64xn9hsjaZJLkNXaRnrUKz5pBWrCYFV0XLtJMVFybTAba4FvQEpG
	OTyQVBDWjC/GXLOr7/bItVinlZpQmbqtCzRX9lNED381DvdpE9dfKh9x0Byz0UoPbeviWfN7PqHer
	MAfY7OpMn+hdpjoLzvO2FRcJU3FTVsQRJmtpCOUdQdJaBhg5LU3cLX78tocFmI1fo6CLJw7Ztwcbj
	wqy+6VMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtNF-0000000773k-1uYs;
	Tue, 24 Nov 2026 16:28:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtNC-0000000773N-1Vod
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:28:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8062F4E41746;
	Tue, 24 Nov 2026 16:28:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4031D601E1;
	Tue, 24 Nov 2026 16:28:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E60F11E685A3;
	Tue, 24 Nov 2026 17:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795537674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=DkZ1ABuSs0XqFw9KTioPWKhCAj31GhHamAleqCJ6xL4=;
	b=VX3JpSiO8UcsPsmc75P4wD4phG8vOx1B3MRJNmTyfC7zJb50+OJmlJSmktDpqTssYXTRYN
	WtnjgCsJtxVUkuwCv1935gtQllbTQllpi7dDfBel5QJxh598glIlMV3QxVubhw4K9jK5bc
	NH92hMlCnISr9WG1VAfTqLNbx541kJOPeLyrENcQq+zjNnKBpT1pFT/IFFncSSjkWJkhgV
	srDTCwPjFpYvNGTtZNFEOYJf4aDfR8Y6tnoocc+w02VBnzwCWplkU/2Y4d8ujgEavS3sOh
	4SnPKaLdxWZaKdFxLtcuSiWa7Bc65AmwjNLxFrlalOLO55EJvTad63tEZLqz7Q==
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
  devicetree@vger.kernel.org,  openbmc@lists.ozlabs.org
Subject: Re: [PATCH v12 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1
 clock controller
In-Reply-To: <179519171774.3795820.3121589367853881174.b4-review@b4> (Jerome
	Brunet's message of "Fri, 20 Nov 2026 17:21:57 +0100")
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
	<20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
	<179519171774.3795820.3121589367853881174.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 17:27:43 +0100
Message-ID: <874id6ry80.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_082802_562412_4B074B9F 
X-CRM114-Status: UNSURE (   8.70  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 at 17:21:57 +01, Jerome Brunet <jbrunet@baylibre.com> wrote:

>> I have the platform, I currently use it for my developpements and
>> therefore I care about the clock controller driver and the SPI
>> controller driver not being constantly broken. I would like to step up
>> to help the Nuvoton team (not visible in the diff since they created
>> an MA35D1 catch-all entry) in the maintaince of this driver.
>> 
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Commit log nits:
> - The subject is missing a word: "Add myself as Nuvoton MA35D1 clock
>   controller maintainer".

:-)

> - developpements -> developments
> - maintaince -> maintenance

Will fix!

