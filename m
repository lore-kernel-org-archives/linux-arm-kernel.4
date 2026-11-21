Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C1C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 22:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XS5i0Guw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFkd+fcH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Iet5KsxqR7lo4w20sxi2lRvcSW5Zv0fZrgqupc31uDI=; b=XS5i0GuwEclXG3
	N93PEEl+yfr2K0vDDjayhBHdRml8fPzJoUUGU9xIgkBDPxmkcO/HziGpOjcXB2GXH6mi32PsW2BVj
	bppA5LIpFb0yO0eAT/ZTox7icBMoFS0nk8SPswqwJWUdxkTfRHKqcP8bkKmhS0dtc4BlC4PWj7lil
	JC11oqU53KPzWXv+F+z5V35WGSzb7NjlLeGHQrmbiOxawNGBRAnWKUCcuEHLG4/n4NM9hifRAwM3j
	rcUYBTb/6xYXdHyB6z1SVuta4IpG71oo6XpoBqZwpllqAuUjMSHHqF00bNI3RC/Wsu8Mjzkds0nMB
	V1rzrahCYy9jebaf6Wew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUtqP-00000000RBg-2S2v;
	Sat, 21 Nov 2026 22:46:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUtqL-00000000RBP-0eN2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 22:46:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F27C42EA3;
	Sat, 21 Nov 2026 22:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3684F1F000C0;
	Sat, 21 Nov 2026 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795301160;
	bh=Iet5KsxqR7lo4w20sxi2lRvcSW5Zv0fZrgqupc31uDI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nFkd+fcHoiPs/vTj9LZZk/HKIlT89NRbTDF2vB43ynoerQHzfelsXEC6TTN0PjVP9
	 NDbexOsEK7IBXI3MnXRTVpgWPcd6popjEVzetrLl+7lOETlBQvbslDAdjoR0NsN+b2
	 CeQ5Bu8jr/ua2g/cF/qEJXB/lf7t8HgnHaSkRoarRgV/g+1Pdgurd8zIrGV8FV1c0m
	 4qvw9nYdQOVAHplDYPUcPhNmwcKrVIB5y6IMFEbCAw744aBH2H9EOJxXCH3foq8RPp
	 ssDjm9gObumxd8LGkJVeZlgjrX21KEHXADNN1dU4S/Md8v+qIm7keqqzq06Z7wZwbz
	 IqqOcnQfHwu3w==
Date: Sat, 21 Nov 2026 22:45:55 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Lee Jones
 <lee@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, <linux-iio@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 04/10] iio: adc: stm32-adc: Validate channel index
 before writing chan_name
Message-ID: <20261121224555.55cc8bba@jic23-hlaptop>
In-Reply-To: <11aa41f5-da69-40b0-9b8b-6c5abfbec5f9@foss.st.com>
References: <20261119153151.1397003-1-lee@kernel.org>
	<20261119153151.1397003-5-lee@kernel.org>
	<av8wzmfrU7zLzGmU@ashevche-desk.local>
	<11aa41f5-da69-40b0-9b8b-6c5abfbec5f9@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 18:22:26 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 11/19/26 18:24, Andy Shevchenko wrote:
> > On Thu, Nov 19, 2026 at 03:30:37PM +0000, Lee Jones wrote:  
> >> stm32_adc_generic_chan_init() reads the child node's reg property into a
> >> signed int and, when the optional label property is present, writes into
> >> adc->chan_name[val] and calls stm32_adc_populate_int_ch() before
> >> checking whether val exceeds adc_info->max_channels.  Because val is
> >> signed, values with the top bit set also become negative and bypass the
> >> upper-bound check altogether.
> >>
> >> Store val as a u32, matching fwnode_property_read_u32(), and move the
> >> max_channels bounds check immediately after reading reg.  
> > 
> > ...
> >   
> >> +		if (val >= adc_info->max_channels)
> >> +			return dev_err_probe(dev, -EINVAL,  
> > 
> > -ECHRNG
> > 
> > However it seems in the original code like this.  
> 
> Hi Lee, Andy
> 
> I've no strong opinion on this remark, whether to change the error code here, and if it belongs to
> this fix ?
> 
> In all case,
> 
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Let us not over think it.

Applied.  Given it's hardening against a bad DT, not rushing this one in.
It can wait for the next merge window.


Thanks,

Jonathan

> 
> Best Regards,
> Thanks,
> Fabrice
> >   
> >> +					     "Invalid channel %u\n", val);
> >> +
> >>  		ret = fwnode_property_read_string(child, "label", &name);  
> >   
> 
> 


