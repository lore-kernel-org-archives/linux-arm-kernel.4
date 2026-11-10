Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B49A606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wMVTjQV1;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=da8bzCYn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tNxEQju2LcZIyxz7a4fO9kHpfCTH3NncFJlSbex+Jnw=; b=wMVTjQV1F3HpRQHlNuFFB4BHG7
	FDt4CXGL0E75IyenFmGkPPbwzmLOP1iEdPQKSW8DusJIQbHgzDk9vR80LAe+Ru1jAreLMV44Yd/FL
	K/j2V9zbLUkeGVizDAypNI/ST9w8QcaLC/8l5iz03bOHRsvDQ41x9KlFh+xSsxscjaQxrtr3rG+z+
	p6aOHDL/zPrNf52bwLwsJNy/xaTfTrI6aTIzxJE5sn3EVr/Un3tJGYu9DjGGD3F01kNGE7lL6Lmfd
	5ouv2yAl1WNyordPj+Q3qTixIrDrsb5ajyiRHTE4HT1Zm/FlPG3oi3ouul3pNZUbbbQSYY87FPum8
	LcuYKn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjMg-00000003Vm6-0IEO;
	Tue, 10 Nov 2026 10:46:10 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjMc-00000003Vlk-2qO2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794307566; x=1825843566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FOTnvyPMVWU/3v7yqUSpO+cSeARwquhqeXdYqmJpiGA=;
  b=da8bzCYnQIz6Qyuf7wd59MtewXMLLfWGS/7//AL/gt0Inm1QLhZqwI1t
   SALS5dpVGQteV2br+dB/Oeerat7tLvXL1mpLUQ8RIElMXqJxr7naVlD8B
   LAzr1nA/TNY885XHbfQqlVn7D7pxhBE/tUIQq8w+65Q7BNvKNO7NqeWzK
   F+iOKsJ1+BX0ahJ/rs5o+j4vL86dh/n8eSjPlsYM1dkcj6F47Shefe7OG
   ChFm5qrAOl66jnrWM6jKWsEl2hDoadflUJtoURNJjwqhhqfv3FXm1KDsx
   Jz71llANFLlTYRzUXeQ4Fhpgj2qz8dAst/keMveL6wPewCndMrHUpLUHc
   A==;
X-CSE-ConnectionGUID: EH+WRW0lTS2CZ0nVqgGGfQ==
X-CSE-MsgGUID: nxvQAS04TDGAr7ksS5gmLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2967254"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2967254"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 02:46:05 -0800
X-CSE-ConnectionGUID: 7AaCaPv6Rdqyr1iheOqhVw==
X-CSE-MsgGUID: BWqKdvW+TAuUWnqaGHQ7CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8419291"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 02:46:02 -0800
Date: Tue, 10 Nov 2026 12:45:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?utf-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 00/11] serial: 8250_dw: share RX trigger setup and
 describe Allwinner UARTs
Message-ID: <avL1521B9qlNh8iO@ashevche-desk.local>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
 <873c22a2-fd3f-4927-a06f-16a73c30de86@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <873c22a2-fd3f-4927-a06f-16a73c30de86@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_024606_761387_DED633C5 
X-CRM114-Status: GOOD (  15.66  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 10:54:40AM +0100, Kryštof Černý wrote:
> > Based on tty-next at 6628e7d4c6b2 with the posted RX trigger callback-lifetime
> > fix [0] and DW BUSY-safe divisor fix v4 [1]. Platform setup runs before
> > installing the BUSY-safe divisor setter.
> > 
> > [0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
> > [1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com
> Hello,
> thanks for the work, I wanted to upstream my changes [0], but got redirected
> here instead. This fixes the issues I have had in a better way.
> I have tested the whole series, so I reply to the cover letter, didn't make
> sense to me to reply to all messages with tested by, but I am not sure if
> that is the right way.

You are doing fine, thanks!

> Tested on Unipi G110 controllers (Rockchip RK3328, CPR-described
> 64-byte FIFOs, ttyS1 and ttyS2) on top of tty-next 6628e7d4c6b2 with
> the two prerequisites. rx_trig_bytes now reports 32 instead of 8 by
> default, and 1/16/32/62 select the matching hardware levels, checked by
> chunk sizes in internal loopback and over a real RS-485 bus between the
> two ports at 9600 and 115200 baud. Changing the level mid-transfer
> kept all data, and the level survives termios changes and is kept when
> set while the port is closed.
> 
> Tested-by: Kryštof Černý <cleverline1mc@gmail.com> # RK3328
> 
> [0] https://lore.kernel.org/all/20261109-8250-select-u6-64bit-v1-0-04bc8332fa34@gmail.com/

-- 
With Best Regards,
Andy Shevchenko



