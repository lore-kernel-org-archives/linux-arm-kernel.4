Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF53F606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q7x6c4PM;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Q5EjRVDW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CC8AtHwZZub26kjn5ZZpKA5wzTG30rrk88z324avJjY=; b=Q7x6c4PM38CJM/
	0wKqy4MMuK4M6ARETsX+Jacjh/5HRt/jZExU4HFBzVuI7hpPqy4pXK16VpDN/vhzHbY50bmWNUZKw
	AK6xYQUAia8sWt1AOHfU/+GsIokckDU8+fs9WUrEfX8tbmAxv93m+90F930izHOuRLBQVVgs/mqxv
	wm8+YiIxs/9SAVgGLBaenntz6TzBUUYcROqGNQI+1kIXJd2RtH2/b8tSyxAE0qge9dDXJHNayYwUG
	h3k+anAb4Ev3cdd5w46rfY8cCxMXZhcvZifh69qDFfUfim2BSji82H8WbR9VLQme7FIzJLfifH7Ul
	o27tkzZdOAxU6Efp2blg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAll-0000000FjpP-1eb0;
	Sat, 14 Nov 2026 10:14:01 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAli-0000000Fjob-1tFY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:13:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E353610EA56;
	Sat, 14 Nov 2026 11:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794651227;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=CC8AtHwZZub26kjn5ZZpKA5wzTG30rrk88z324avJjY=;
	b=Q5EjRVDWT3H/xWt3GrsIshGnhpWFrEavh+eY86S263kmWctWNZfRU81FhBHggWF4lOEiU8
	msuBYOQeLmINg7TkyrL2pIE+U1NBKu7F0Cleq65rQLXW1ThqAgPvFjPojlt88O05F2wvGl
	luNUArApXeMXrG78BtVFq+d7brCadobBVCAJAMkxTTNaiVhM55NGeLJUNyBj8pdzPTLXg3
	ilhyqPcs1TJ2vmHg5758GYcaPugsyYvT2y3PXWH5pa2Rw9iX8hAPM6qtV/kHJpXSTfQtC5
	ehI6eOc566dPy2zbwP4WWukIHfF4JJhP8VaNZ3tBr3WGhhB8XuT6y2AyxNpbnQ==
Message-ID: <6fc041d3-f66d-47c9-9dc1-f47b4c416104@nabladev.com>
Date: Sat, 14 Nov 2026 02:00:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: mmci: stm32: reset and restore SDMMC state on system
 resume
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulfh@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261113-fix-resume-reset-v1-1-115b3da5764d@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261113-fix-resume-reset-v1-1-115b3da5764d@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_021358_724793_48976BB6 
X-CRM114-Status: GOOD (  14.06  )
X-Spam-Score: -0.6 (/)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 5:35 PM, Christophe Kerello wrote:
> On standby exit, the bootrom may reuse the SDMMC instance used as boot
> device, leaving the IP in a state not known by Linux.
> 
> STM32 variants do not set pwrreg_nopower, so MMCICLOCK, MMCIDATACTRL and
> MMCIPOWER are neither saved nor restored by mmci_save()/mmci_restore():
> their content is expected to be retained by the hardware.
> 
> Add a reset_on_resume variant flag. When set, and if the card is powered
> off and a reset line is available, reset the IP on system resume and
> restore the cached MMCICLOCK, MMCIDATACTRL and MMCIPOWER values.
> 
> This is done from a .resume_noirq callback, so that mmci_irq() cannot run
> on a state left by the bootrom once device interrupts are re-enabled. It
> also runs before pm_runtime_force_resume(), which does not resume the
> device if it was already runtime suspended before system suspend. The
> clock is therefore enabled locally for the duration of the sequence.
> Clock and reset errors are reported to the PM core.
> 
> Enable the flag for all STM32 SDMMC variants.
> 
> Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Tested-by: Marek Vasut <marex@nabladev.com>

Thanks

