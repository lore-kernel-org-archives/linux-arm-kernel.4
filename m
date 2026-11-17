Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13995606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hH/iW47b;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=heECBdo3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kLI25bkyEOpFVWxpFGa0Dc97choniDCAakGqUy11xdk=; b=hH/iW47bRPfK9/
	t93Q9+12o9LhLFx8zDT4H3onrAtGDmt5TXYR3QmGbRqa2t3hMmo1c1/iOQiTfWm15Za5dXTUlaIrv
	NwpLqUsws3rc/ZAEDH10l37FzqPWluBX31mIQbQkSF9/5oad68C/R8JQqyx404fE120q4FvZ+sXz9
	VVfWvB817EgjTMJ8Vd9MgkxQ5DOz9BP6KOq9y2uWV4IRCq96ZEOkvjdcGY3uD8BZDl9vzjJNeUR+M
	IDUSkqEhnwk5HM6ZtgLDx0FqJaNKPGdLZM4drbQ/C891GDdkmv8cY/hcK+6PkN8M0VuU8msNbHa9n
	9PNUXvOA1EHQNsQUe0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTH39-00000005OZc-02To;
	Tue, 17 Nov 2026 11:08:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTH36-00000005OYp-3By7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 11:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913706;
	bh=oxvQViMU6UamivpQ1Wc/wZITpefIgLczFvQSjzV78bI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=heECBdo3wDplXuRnvnV0cnRaSqjQC4O0371jNkrw0g5rtXP6vayb2jwPbg7pQdpRH
	 3Vvw81nX9fJ6wJuaiqoeOd5P7z+W+vEbktu2seaSXFJZu9UNCocZWUCyM9lHEeQYcC
	 Fuc8ApGGeSkVKTKP7sCG6nIATe5hy2YxvnB2d011Ra1R7JlprbB239UAOlncHQxqfi
	 dBDOvt2u2lkX29e+3YSBozN3N4/ovp4OAr4+cbdOXoLQZGxdb6S08HrjQLi+ebc9T+
	 oUACaS1MV6Pn5LJz9IK9jgDE5iY+wbv80Ps1aLUmG75uGKQGj5NwGEu8UM/OdbHJIO
	 7V/XYFh3lWc4w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 409A117E04B2;
	Tue, 17 Nov 2026 12:08:25 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ge Gordon <gordon.ge@bst.ai>, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 =?utf-8?q?Yu-Chun_Lin_=5B=E6=9E=97=E7=A5=90=E5=90=9B=5D?= <eleanor.lin@realtek.com>, 
 Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Michal Simek <michal.simek@amd.com>
In-Reply-To: <20260523140242.586031-1-maz@kernel.org>
References: <20260523140242.586031-1-maz@kernel.org>
Subject: Re: (subset) [PATCH v3 00/17] arm64: Use EL2 virtual timer when
 running VHE
Message-Id: <179491370519.165314.8991090307928183984.b4-ty@b4>
Date: Tue, 17 Nov 2026 12:08:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_030828_956771_40F642B5 
X-CRM114-Status: GOOD (  12.09  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 23 May 2026 15:02:25 +0100, Marc Zyngier wrote:
> This is the third version of the series initially posted at [1],
> which
> 
> - updates the ACPI GTDT parsing to deal the v3 layout and the EL2
>   virtual timer,
> - moves the architected timer driver to use it when running VHE,
> - fixes a number of DTs to reflect the reality of the HW.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[11/17] arm64: dts: mediatek: Add EL2 virtual timer interrupt
        commit: 0b3f2f7ff214827043a13549e1af6bd73f192768

Cheers,
Angelo



