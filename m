Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1DE606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FXEoEDvc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3QMTgXS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/KjkpuXOQc02cY2McfdMzArCTMAfJu7UfGVrhriKNw4=; b=FXEoEDvc0DvyyVc+RvH1doBi0j
	tTMYQAKN9k0+MGq85tVIx/QJY5JseArQ43wV93bi7KGJ+5wq5iV0o0ueTcwuIgOPg4Pb6yKt/cZt/
	z9ud9m/ySDAnrdbrvMxumqAwpZjc0Tb3n6DNkdq2BlbZyuTRs/HRZYsyCV5JpfIGOd97Zff4nuh+r
	C2Cn6F/nXyLkHAqoIXGOXSUdDKt8m2yeExQZ4jwE/9NUMK8hUhje0k8xdOuWxNTA3o6N0K572jsW4
	rrEpIf1UKtmfcG7L1wr9tte8ldaPRd6na0yeE8PK/k+OqVZw+d9kXZAGL7TNyviH+6nhKzeIXa5Mz
	f1yGavHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXSK-0000000AZ0I-2L36;
	Thu, 12 Nov 2026 16:15:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXSG-0000000AYzV-2tZ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:15:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id BC7F1622CB;
	Thu, 12 Nov 2026 16:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 914971F000C4;
	Thu, 12 Nov 2026 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500115;
	bh=/KjkpuXOQc02cY2McfdMzArCTMAfJu7UfGVrhriKNw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H3QMTgXSHz2O459pGAJTEQ38sCmik+U1N5kIMOKuvVS7tfBNBMe+j4RT1ej/IxuYK
	 +n/HfVEfrV7eQjrvl2uzQDsdaIeMKjZ678nLqQkRVewqn40r/0FiJv2mUXj8bY+abU
	 OKPriIqudTnFhF434GQiTC9+T2XjBhu0xBn4CcVMok+EWbkN17Q5wnEHIZcY88R6Va
	 /ZfEBvNPKlvvaYSStR4VZOibqK7eu8gslBNVZWz7udaSweA6NS5trCdhjGKjlPfPQB
	 bnVzLqboLbE9HpEWCQPT5XGiNYCjENTEuNz09oSetuwgfbc7r/tpiDrPcFltVTyweD
	 eAUnQMn5zDuCw==
Date: Thu, 12 Nov 2026 17:15:11 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] pinctrl: scmi: mark the GPIO functions
Message-ID: <m2f3tyenb4udselq5xotvgxp3fijcyprdae724oroefyw2d3ar@4rswobkdrd3i>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>
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

On Fri, Oct 30, 2026 at 04:58:39PM +0100, Clément Le Goffic wrote:
> Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

