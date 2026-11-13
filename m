Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96969606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N/34Wj6J;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLrk6pis
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/biTTKcUHka3zKSQUOs5KZPMEwsKgo7eo4PgO2SJ3W4=; b=N/34Wj6JdvrwNf
	8jroYIhlerZKWhqoDAu/uwr/fhtGwWaKv9Rwm2wdyjVSbaR3hPU0Nz71Mox1Z7fyzrwbvzmPTCcIx
	Awi1vSj7d9VYWrN92GSO+17CZpOLBdNYsBB1+8pTkBC+nQ0z6YW6eBSJ61f/0qFP/ft7sMeWWrXsO
	QPFT+keFYFwhUWVhaR6sovvx/EOx5WcGTb6IW4Z4DgkwoLaojX7qi2Ew+3GYfoSFPM2xvVFzH0prf
	lBVgOjvMqUi0RScFH1yfnsgKAtR33a7LMsVz+LxIHu75sbx5p/E8OerBcn4t6erAoekSpTlLyJbOQ
	B1EfeDe59aunVrdv8AEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsN4-0000000DBKQ-03PQ;
	Fri, 13 Nov 2026 14:35:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsN3-0000000DBJs-0syw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:35:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 937AB62412;
	Fri, 13 Nov 2026 14:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6611E1F000C4;
	Fri, 13 Nov 2026 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580516;
	bh=/biTTKcUHka3zKSQUOs5KZPMEwsKgo7eo4PgO2SJ3W4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dLrk6piseWNXVCCEMXUmRWhuQTY7B3NDnooOYqsYrMeWFqk6cw2zSeujPwK0DKCMk
	 IzaauRblFwvlBQ4UKUGJzWJIi4QnDFL47bR7zsF9E84861HQ59m8oZ0yoaampCToAZ
	 YgMqdx8fb/hcmCr20SocNtg4u3o83WHmVs6TH++t+opSgfVJ0UUp17qgOssYgCOVYS
	 BC7es+LgO0Afy+6DfnYKwA6mbC0oZjNmZkBXz5JBminFpFwMs4oqqoIPjqQL0WR/s0
	 2ODGlvp1OxC/PF8vTsZe+LEFqxKuzrqI8cpXTvkN+XXsqBxZ0BfOtTY3wXp33R1MER
	 9Bmw4WAl0oEyw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] mfd: Constify mfd_cell arrays
Message-Id: <179458051215.67128.2369418349432820499.b4-ty@b4>
Date: Fri, 13 Nov 2026 14:35:12 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 15:02:41 +0100, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.

Applied, thanks!

[1/2] mfd: Constify mfd_cell arrays
      commit: acf1fcf6862f960de957e6cf5fd0977475f6be55
[2/2] mfd: cgbc: Allow compile testing
      commit: 82d717c9c8956f5894e08e112f4aae72023cec86

--
Lee Jones [李琼斯]


