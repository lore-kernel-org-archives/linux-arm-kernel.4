Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76743606A686
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vC6/TOsn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kuw3i/W/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tb8wm//Z2DWHkQayZbIfmLnJvc447+MeYyV1guYLOyw=; b=vC6/TOsnORPXeHpX5mQo6DxfBh
	758cOk1uQLlpMRAhve2698RagSDoGsnexFbvAXWQLw7J+DXP6DN5j6EW3eYB742S9IMUkIavpOp5G
	RZc00MDPDh42Jy563BZnhjNabXzI6C/hj8QP4yWvmfrsk1X0TlFr0kBCPcP0CbKd4CJxqvfX2MZj3
	zxHL3/UU7WTbE72ooHRMrFWj8EnMls/0ozVu9wymxqBYcbXTcfztkSDBXl31NYwE//PQoPnL0vrOQ
	DgbVj8N0Le5lOR8u+veWSHQFaqcGkmZRE5g3DFE3pB8yHTQE7gcmOxkgm6ZIa5+5SDbTMOLj2Ha9l
	3xWEeq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFGE-0000000ARwO-0Xn1;
	Wed, 25 Nov 2026 15:50:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFGC-0000000ARw9-3OOB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:50:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 437BC632C8;
	Wed, 25 Nov 2026 15:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C0C971F000C0;
	Wed, 25 Nov 2026 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621815;
	bh=tb8wm//Z2DWHkQayZbIfmLnJvc447+MeYyV1guYLOyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kuw3i/W/jtLmA1Ts/BTtCRAV0kDdVWCskpWL24jRLED55WzHSBRLsi0h3YZhV1s27
	 D63nFumsLv3cybO2Bm0eHQfMCBO2eKdBXAZuP5W/0ofWlJn4N8tYbcE2a20kEez2Yz
	 fqcWc+RjpUXs7tM41+T5IF26KyxTbk/hnZMFwk3l5cuYpqyb9NjQ8w5YsbFgDRICHn
	 ApJIt05oggkQs8ULVP1tUVp3kNlBvDX0C3c17U9NkC+BmzbEYjNIGM4+C4Yf4Pu8Et
	 kTBmT9UEI8mHw/DSsitTzPhkzpQeQPg19l1E398RaFClJnEC4yYYSZrjjZZJd6l21i
	 H9nBzlXareA/w==
Date: Wed, 25 Nov 2026 16:50:12 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/10] pinctrl: scmi: select the GPIO function on GPIO
 requests
Message-ID: <uwppebmjytpb2qmprqdfgsly3srqwmbavbm4edjb4e7s2jymiw@5af5prsdps2i>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-10-d61f039be008@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-10-d61f039be008@baylibre.com>
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

On Mon, Nov 23, 2026 at 04:21:32PM +0100, Clément Le Goffic wrote:
> On a GPIO request, select the GPIO function of the pin, on the pin for a
> pin-only function or on its single-pin group. Without a GPIO function the
> mux is left as it is.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> 

