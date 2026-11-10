Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3940606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ma+n7eMT;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FKqPN9Vg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eSLFMl2R3lB8+9pIKfTRq+QhKw80CpshDdlYvBLLhiE=; b=Ma+n7eMT8pIJezwGla3sG0FezB
	zQus1PsOr0Lk6s+7FbECyQ9dv0+kMEe06L5hrdd3RWIYPAIhAHQ7UJTlUhZjrSeaS9OyVzCBn+o1T
	WmQy9Zre2p7WjvYlc37o13Ovnkjm2/b+vtdY/OiGjXLxNaICVMuyovW34uwhyeh0BGxjWj7/8Hvm6
	y47ex6A+85bOi5f6cFj1vSaL6/g/LLGCf8HCSPssKNXNZsshc0/leZsBExYc/o769C0qZmIA/F3Jg
	8nJAP1TVbUHEy7XnkOvZYRjAkEFBDxFDAYCwonCAhpHqJlRyD36lF/B9EcP/f6yYfKDbcqre+loi2
	WZIh1GvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjcL-00000003Z4T-0Q5J;
	Tue, 10 Nov 2026 11:02:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjby-00000003Z1J-2eKI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:02:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 347101BC0;
	Tue, 10 Nov 2026 03:01:54 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 407D63F85F;
	Tue, 10 Nov 2026 03:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794308517; bh=QlNntSieLC8S0YvRLd6Wfbbt18c4nXb06umZDP6TNas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKqPN9Vg0UBCyIbmOsaTZulIJOB3aI1y35vAsOHgGOHwrXPB5Vb0mWHldy5uSiAea
	 /rtVJRwnHK11B55hGPiy1hFaXYryF7/WHJ3KdNjJ/InOVLq88ffwfxbSGvPA0y161y
	 pTwsUdcVncKo2fkyz2aj3wWvKP/SCFMfM5TxsMuU=
Date: Tue, 10 Nov 2026 11:01:52 +0000
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
Subject: Re: [PATCH 01/11] pinctrl: scmi: send the drive strength in
 microamperes
Message-ID: <avL5oKJtdiKrzLlg@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_030159_966251_B7F931C0 
X-CRM114-Status: GOOD (  10.26  )
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

On Fri, Oct 30, 2026 at 04:58:32PM +0100, Clément Le Goffic wrote:
> SCMI gives the drive strength in microamperes, but
> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
> Convert it on set and on get. It is the only unit that differs: the
> debounce is in microseconds and the pull resistances in ohms on both
> sides, and every other value is a flag or implementation defined.
> 
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

