Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84449606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OWg/R0Nb;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Q95X8rex
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=euH0BJNlYcSHq5yr15pcFlaT205pABUUGFubW7NpuMk=; b=OWg/R0NblXE5ZPWSfMW9kl2P+Y
	3b7wJHs0N/0TKqv+axogQssVCEoiJsf7kAB44LLHY3Kv+qr2KZT2yOj9nhS+RrwCE5VROlHb/ba12
	ChgIyAUslNZncbm2CRUCYXpmQclu7Evbk6HUBHcod3j1+HuUONHAJ20K1wDHBaKIkVXplz3P8GX7e
	EMLEAnqLhwUWEE/Xg4Y4Np6gHMQZB7+7cPJ1WYIKtcCtvz9P26lCMsbLt9LuXvfWLb+1DUUu5AufU
	S5RSgxVCbPB4br3EyLt8m/7fnBVyKUtLeQp580eQFn9LN5lMhcRr9QeUYu87t7q+0k1rU+21uruGB
	A128LiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrzR-00000001ZdK-3uFS;
	Mon, 16 Nov 2026 08:23:01 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrzP-00000001ZYy-0ZGv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=euH0
	BJNlYcSHq5yr15pcFlaT205pABUUGFubW7NpuMk=; b=Q95X8rexII/3mzewfYJW
	zxeUCE/7KqQCyMLyUMmoeiOuyWjlTDU3Yc5WuzAQun5UV9NomJD+Ib327u1CS29D
	shtsvpCX0eqF0eEivl5cIuWdGSKGRcdUNH2AUiHRUHIvA3n/tvaSrHAzyc4CYfoa
	uipewViPV66CHwwtpqiRO3D6fefOqCDADfJNOpl2zduSD8JVzHk02Nu0VIHQZ9YS
	TjLAmPZw9mgkrkzy2e14AgsJ6ndq0fnQYF8CsGybikyICE2iFjgDs7qW6VY8MGj1
	laiTd9GEpgasBafTlf2S8/PayX47qKq/sVSbGcq+BQ1DSzqGvQ/lupXTlDUfliK6
	NQ==
Received: (qmail 1195362 invoked from network); 16 Nov 2026 09:22:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:56 +0100
X-UD-Smtp-Session: l3s3148p1@uvIkfGBgKooujnv5
Date: Mon, 16 Nov 2026 09:22:56 +0100
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
Subject: Re: [PATCH v4 8/8] arm64: dts: renesas: ironhide: Enable SCMI devpd,
 sys, clock, and reset
Message-ID: <avq9YAeAsAgc-btt@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <a66c5ceda67314eb9e86224eb555adf5ce00ecbb.1792163045.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a66c5ceda67314eb9e86224eb555adf5ce00ecbb.1792163045.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_002259_501367_97CE108F 
X-CRM114-Status: UNSURE (   9.64  )
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
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 05:55:47PM +0200, Geert Uytterhoeven wrote:
> SCP FW SDKv4.28.0 and later for Renesas R-Car X5H Ironhide not only
> implement the SCMI base protocol, but also the SCMI power domain, system
> power, clock, and reset domain management protocols.
> 
> Enable support for the latter by adding the corresponding SCMI protocol
> subnodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


