Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F924606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ph5SmSyv;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gUpB7Ms6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H6y3PWhbhmjJH8XU6/GXMjP5//jRrDgQxTjcYvOrbII=; b=Ph5SmSyv2F0kDepdlvAG/ff/c8
	DKG9lZ3JiiNj+YpUs36beJ10NfJR1GZOCDlBhIO2v/7Oo6oIAzx2eDE6TSmgHH4g480RqsAYocuBM
	9LVTzAOtRD7jlJY4+HviH9zijaaM+ZMW/47vP0HBcj+eNHtB4L8bzV4PHQYAIAa2WxEgqiZPEhPow
	AdojtrTNF/2O5Ti9Xm1m2MxNSRbd6vXReclhE8jZi4EZEgftqIpiLO0EFtJVqqxoiy+S7jOJG14Fx
	xzsHRcw4NZqLpNzC+1Y5Ixzfb0tBS0eI+jfhnEqpJmgEZOvEzYf4De3FpHu+vP12g7WXUqoL2xhP4
	W3esmjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnsS-00000004PLs-3wXe;
	Tue, 10 Nov 2026 15:35:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnsP-00000004PHx-0kve
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:35:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22C1B1477;
	Tue, 10 Nov 2026 07:35:09 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FCD83F85F;
	Tue, 10 Nov 2026 07:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794324912; bh=carP3vbUYgr8qsVNCpHh1imjnhtxGTpLlqbqJ7iqKl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUpB7Ms61i05bC8pBOCmVktL30n76DdrZCKYLCh8SWObKFPJerLKXPU/SaDxKV/x9
	 esE5Z9dOguoSs7rVsiuV5wFfhNxTC/ivfdnVUn3IVcDEvTgceqBYhUkGeUXdVHfgQG
	 X4wRc8iZlpvOnHotbK6aaCzF0hZg8GKH9L4tbHQs=
Date: Tue, 10 Nov 2026 15:35:08 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
Message-ID: <avM5rBHedZDn45kc@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
 <avL-4lquUqW9lUNh@pluto>
 <7f613b00-bafa-4f4d-889b-4e37f5009b6f@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f613b00-bafa-4f4d-889b-4e37f5009b6f@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073513_366015_FCBD53C1 
X-CRM114-Status: GOOD (  12.80  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 03:47:33PM +0100, Clément Le Goffic wrote:
> Hi Cristian,
> 
> On 11/10/26 12:24 PM, Cristian Marussi wrote:
> > On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
> >> A get of a setting that is on or off, the flags and the pulls, returned
> >> 0 as a value, so every one of them showed as set on every pin. Return
> >> -EINVAL when the platform answers 0, which is how pinconf reports a
> >> setting that is not active.
> >>
> >> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
> >> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> >> ---
> > 
> > LGTM.
> > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> I'll apply Andy remarks. Can I keep your Reviewed-by with those fixes?

Sure.

Cristian

