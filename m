Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C78606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m+0ehiww;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AUsecSuL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=; b=m+0ehiwwdTyXqC
	efIc7hb5ybgoMfGBSV2tEEQg8n6mzz/PBlJZaBvKIw3PZUuQlbJlrLbNZ/4fm+xjYmU7coNbiuy6T
	HN9Tvg8hUC9lWrGnv3v2TKRxpMmWQGdKFR/sltJ/UB+a3qKyXZC1v1MangGTJX6q6///Cqdw9Gn0k
	K1liQYF2C1toe10nC/8V5YJtAlMZMhq4DncZl2vpb03xZh3KcPXlkDNe8M61Csi5XcemD2Q3UndEE
	boqquo5GBU601F/LnSmO7IE35tDW/JDSNRPhQakgNtH0Uga+GvyFJhiFz+WCI+Ve/ww5rqmUIrAf9
	N52KQdAZaIwSjQj06lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURNz-0000000FY2M-0SIM;
	Fri, 20 Nov 2026 16:22:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURNF-0000000FXml-18E8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:22:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8028555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795191723; x=1795796523; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
        b=AUsecSuLkAZoBkQyamwxg+LAvApB2GYbn78lyItvcOHMq9XIKNN0/EqA4tPgHLOrbn
         uYVwRTNKgzlDuGAjchHzBmEf2PKhJyjBSiBMEHcjUN5VM/sybICjh3qE9864QcosTeLT
         OGA9auHQwg2NWGFSCNVtc31AleKtS4WbeKalS5usbGXHOrkwm76m8n9QbJOQxWmJpXSS
         IHOhvDR9kbM/YyMYQ/hgaZa91+DOR+sh77vF7yv6eXhJ13KK5Rjn129xid2duO8ueoQB
         px04I66xbBBk3Y1cSiE47k/bmJexUZX74f4+yL7etcwF4CzarFxcmabsZV86W6fBw0Z0
         4pHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191723; x=1795796523;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
        b=TLXTkDdMXp8/4E6C28WddVXleo1vhdR22vl1mP8/9CiOSf7kPNkgt6Dr49tcR4v51u
         kG5fAL31FFDQys2Uf66JobX5LVtThC6xzD0ytIcSeG6cxxw9XvlGS5wG/ql0RxGJUFM1
         QhYrgbdh2dpaRoDRu09Ijb+8FGyw/ABWBs2p3thisauDNniRMaKDfrw6oeDuY/mX1LpN
         pnYiqxeFNSIKhMCCbZrgNRxBYrTxn73ci5Cj7NXFH8di4u3y6o2oE6RnsB5sxdBSJIai
         lIjBbndQkeYm/GbbFLvPhj78igrQ4QzW8TRxT5egxWsNK+vwrQ7PCVrQztuCFp4jBK8D
         SehA==
X-Forwarded-Encrypted: i=1; AL+hErEaSzFbj2La3wVZyVMGcT9KKStw91VjafwpTlrdsykQCC4S9OPK4fzQFQ4VTxapJFUOpDCOYo0Tr2NkuX9lI3um@lists.infradead.org
X-Gm-Message-State: APuU4Z+zryU2ac96JmrYqPuUK5BKH8l+FbdifvZ8Li9nIqAWyIgHB1ti
	GN1CdTJ1dq+TbHsHvEyPLr7idjd5KdzhL3lZIAVDayqoOB2leNr/tzkGeKiwtNXGHA0=
X-Gm-Gg: AYBFou0x5atnD5HWss1lhkRM9z4xARU+aGNBozYJ8rSgZF4xMhgXkJ58Qox4rtjs1Q9
	guq2h1MJHngzKhRyLqyaKSwQ1U+LYcK/ELVptaOCnmzmxjMfE/zq0ldW1U1WSFOlUDNcmx+LzSI
	8dUKCRpH5O0nUwwf5Diibq0uRtkjxE68kduJIbFrHo46kd1oFFlz2CGGbFt+llc12oosyJBcrOL
	W0Zo+Qt2rtjBJgQYEMn5AFoBlL5y9TWSiV5jlRq6/N8JKod6/pR1flzqKUeEreqXNIFsjWfth3s
	MCW26eGbOqbl0anZlLhMH3jDoM3CzKnaWeOGqJTMN+oVhMbk/XsIjZszYr8tgILNoMuVJvTmqSs
	vYKN+IO++hhymEQCIcqxRuXy1xVqTOvfg63KErbQsxVG2vsI+YpSyhufg1I93MMJAHne2kuef9x
	1K1KPskpdfp1HFMHaokUPk/8O7Uj0yUGE8R9o6wBQoQiR85Hqv7/Fq2oFz8hu7e1ihcDbTK3dSf
	FgV2LKmVCS504Hnuk2fQVCKxtovt8X0Ir0ZN779yfYJspBu+MAyt9e05UAhcLVL9ILJTJa8/u3b
	7uWQiKtgYwoY16oENA6XAw6OpcQA7Mv1h7W2/usPbcx2kjLC
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr92312295e9.3.1795191723347;
        Fri, 20 Nov 2026 08:22:03 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm137854885e9.11.2026.11.20.08.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:22:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v12 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1
 clock controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
 <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
Date: Fri, 20 Nov 2026 17:21:57 +0100
Message-Id: <179519171774.3795820.3121589367853881174.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=UYAuJv9SVgURGKW/pKO2M7vMHBgjYbXz0H2zRl5sLMI=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMxcufFn3NUD4mbSymcPHS9iXCz8sUe2X4GLL0RHsYf
 By1gyM6SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMJF5pYwMj9eqR/3X/nTu9Pwp
 X8wmLIr1uLFhAkNJevMtlgmutw10XRn+V89UVdsW7afy87rS+tO36nYKuB5ZLxh/zPbCkR+ztzL
 oMwEA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_082205_725509_6FC0D13D 
X-CRM114-Status: GOOD (  10.83  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> I have the platform, I currently use it for my developpements and
> therefore I care about the clock controller driver and the SPI
> controller driver not being constantly broken. I would like to step up
> to help the Nuvoton team (not visible in the diff since they created
> an MA35D1 catch-all entry) in the maintaince of this driver.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

Commit log nits:
- The subject is missing a word: "Add myself as Nuvoton MA35D1 clock
  controller maintainer".
- developpements -> developments
- maintaince -> maintenance

-- 
Jerome


