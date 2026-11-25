Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CDD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X1Lm+Y4z;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcwhjSj5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lReQU7NxzdyMLitEYTvwzWGfAmtcYG6PsRCCypVAxzs=; b=X1Lm+Y4zt+iBELyRPpBbCcW/la
	XC6p6cT63ZWsK4bYASTZiXTXavNpBP6i7zvG3UEgDK8Wm6vW7rpdCbowyi+RlVdPQ5+7hMxi+zdY+
	SwBmt74F+spT47CwDHo3HuhkQZfeiEKlXwJ1/dghzljFU7s72S2dALH498f5K+oafjCmbEHJ3ageX
	T+bfaBDGkKtItdDqhxt+u+9QFql2PKf197+4CZoIEHvgGg3Yi4xTPlBIN78lFa8H4SLSI2Hq+23dg
	A+Rl+WtEEBDcH434ou827YelFnxd6h56Fbh3xsln/i0EZi0Er38WBUHoN3ea4/MjKLaZ5FfhRbhFD
	AEY+0FIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFFy-0000000ARtA-49il;
	Wed, 25 Nov 2026 15:50:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFFx-0000000ARsS-009W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:50:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 73D9640A43;
	Wed, 25 Nov 2026 15:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 51CAD1F000C0;
	Wed, 25 Nov 2026 15:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621800;
	bh=lReQU7NxzdyMLitEYTvwzWGfAmtcYG6PsRCCypVAxzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kcwhjSj5mCqxTTL5+HrJ8rdC8TQJrCBNEXNJ6m0nWYz0CFvD+eYim46rHqhjVLQlk
	 +o3DnzrC4kT6wYlje1joZuoI2JUatQ/K30dY5KNDbjItjCGQhCaVX2jqSVueRgx+hL
	 gKCossHBXSyKY9+DF6TXn5y2PoVugOU3oQMoU3l90VlS39VCi0lPTBD7u+7JeAJmgb
	 Q+HkSI4NyF8kWHoIcrixmj5Yh+Up7SnGMGLRiSnrWgKTrvfPhAu+EiQfaoLiUg3cKK
	 BzeARjMlN5CyFmoaEPJ2Wdrgsf0TJxF00EdCS5Kgu1G+LxZDcrIYJvQrhV+6gZwaoV
	 AFuSOFBvNSWBQ==
Date: Wed, 25 Nov 2026 16:49:56 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] firmware: arm_scmi: add an operation to set the
 function of a single pin
Message-ID: <saazm4ffmsvhbbohfdfqphfvhkcfnbagnkcwaguctdylhgh6tl@4a5fi4es3klp>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-9-d61f039be008@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-9-d61f039be008@baylibre.com>
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

On Mon, Nov 23, 2026 at 04:21:31PM +0100, Clément Le Goffic wrote:
> Add pin_mux_set, which selects a function on a single pin. mux_set only
> works on groups.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> 

