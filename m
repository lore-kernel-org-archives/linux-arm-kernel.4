Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF110606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VtXptPFx;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=a6f7XXeI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hFHwL0dJHfEmg6WJ1ZYqq2RC1KHegZZ+9GEzz7lTf8g=; b=VtXptPFxuSCJAqHpYUaE11ogbF
	aBXbQDBxrhQaKYE2uy1RIdcJr0wOMqgg4RnHv+NfegPPz5Wtv6K3dkSgTvMS6Lo+NK/vU71XFER+1
	nFj8a18+iS0AGE4fJ0d/R5h/qLxkPhmX6urlW+L7AO6XoB5Cek0X0QkjjkR/31C9wB60hnFQPF6q2
	Jzr9hFKaIIM6rixVmlgIx/uJBHeSs7IJtMW2dFyTP7btGdcpXzmMh7RPPsqWkPBzOLoYU1r59Rw+9
	8mXKlEXw/kz5NVAOik3JFInL9qJ7UCh/4DZX3CbEOn59wPq2ATStqqbKJYhSSHpXQKrjKgkHZGK2a
	Gavy+RRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSryY-00000001Ymt-2Bs4;
	Mon, 16 Nov 2026 08:22:06 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSryT-00000001Ygv-3XUM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hFHw
	L0dJHfEmg6WJ1ZYqq2RC1KHegZZ+9GEzz7lTf8g=; b=a6f7XXeI4EbsDhCBF8mg
	EX6BluFyS6AAEdff0oZDzmNir0+tHKQfuoo9Ud2sFZnXmUqkaDEenLfPyMLoVwQt
	q9jxxpbDOp7Fe6Ie4a+IRFfewMG9IHTvnGVAgG0YFvkYVD02XuYl7bbFjToGH6VZ
	MC1T308y/oIwXKHChAX8Hvpo573ARyScH8pNA9GE+OEH433phKGPavS0PSlR2oCR
	lzl0YfbXf3+oV4J0oPwBp3EhjPWHkkfhATrc9Td5LkXy4YuegozzUle2gKLAaK9g
	aUD5estbCHMNCuTAydnLrBZb6ldUjle5Q+dYJ3771VHcZHXVtbO78xnP+5kAewtD
	kQ==
Received: (qmail 1194292 invoked from network); 16 Nov 2026 09:21:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:21:56 +0100
X-UD-Smtp-Session: l3s3148p1@dYeTeGBgHroujnv5
Date: Mon, 16 Nov 2026 09:21:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/8] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
Message-ID: <avq9JH17YzYlO3Hk@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1792163045.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_002202_866865_6B324540 
X-CRM114-Status: UNSURE (   6.42  )
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


>     Describe hardware in DT, and perform mapping to abstractions offered
>     by SCMI in Linux.

I used this series in multiple branches as a base to enable further IP
cores on the X5H SoC. Worked fine, so tags for testing are coming now.


