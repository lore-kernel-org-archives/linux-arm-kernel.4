Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F4606B189
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5Cx06UaV;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YlrRRqxJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=frrN9eP5VKX7iihEaJrF6vLJxtmPHDqRPsxohmOYZu8=; b=5Cx06UaVkAZ8Y7Mnb3vDGlPgzy
	8//rSis1OWgxar0fI8tIrRemYmEyB9m3GQC5MDdt9DXzhLmK9AzqUO5asQ9u1NSBakTKGdil901IW
	PN2qP4QZvHaEpuLqK2yd76/OLoqW8kd4DxsPUwwD1mG8SW+WxZ6aoR840fp8emJvTrLK5l3GSU40z
	GvbRL6V9j04c++MKw29Jx6ZwF/jtuOodyqRJdMSZFXdnKKOyosca6bnbkQbHi3VI6YfqGfAN3p2fc
	unwqnAjPaERe9dXLbAgDOyv4fG7VyaebPbyCM7Y5U+iPs9wG39AuivELdsTqCYGPbF+aMX7gN3gbl
	EMISKPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlmU-000000041gO-2Hkd;
	Tue, 10 Nov 2026 13:20:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlmR-000000041fr-3WbX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:20:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3005143D;
	Tue, 10 Nov 2026 05:20:50 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42B2C3F632;
	Tue, 10 Nov 2026 05:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794316853; bh=8xoLOeJ5D5iFRiilyKCfOmsSoEqiyL5IFmDWa/z/4zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlrRRqxJ8JhiltC5XonPWyDKEAZUX9aNRSAVZjMvqQiTyKGuXTb+idFqYGPuwaIag
	 nQ+encbFYzyVaX9z3KOlVt0FSRaLwHkhbY92gqU8sUcKEGir3sgzFj6iCvV90X+KAl
	 weOqY7W88IHI2Z7x31ynnQQgVOS0SOZ+NkZbPO4M=
Date: Tue, 10 Nov 2026 13:20:49 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] firmware: arm_scmi: add an operation to set the
 function of a single pin
Message-ID: <avMaMftPv6MTM6Qx@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-10-52d92843ad97@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-10-52d92843ad97@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_052055_921678_D5A0C2C2 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 04:58:41PM +0100, Clément Le Goffic wrote:
> Add pin_mux_set, which selects a function on a single pin. mux_set only
> works on groups.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
>  drivers/firmware/arm_scmi/pinctrl.c | 7 +++++++
>  include/linux/scmi_protocol.h       | 3 +++
>  2 files changed, 10 insertions(+)
> 

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian


