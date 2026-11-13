Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD66606A880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQRIisWM;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=LfgBZhML
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:
	Subject:To:From:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j62tYvTCL3OY1v0AvDAlDk7Ai4ZdN74KnfRG5/OoDtU=; b=FQRIisWMsAoDXT
	unRgFPlXF+bLuO//bDbY0ptvipEX4MbehcZZMV3+/rdLf8plDmjg4BaZKRW9/0E0GZ2j/F14/uRZv
	1paQOJMMcTt6PcriBGow2hmMCNRDJq37FPtUa5zlJRY6BuPChezXk9joqGU5tdFZk9tGEHATzhtZC
	dzG4IU0EIaxNpugPC8CoFpZryMldukDrYHl9Dz8BEPKzRkVDdL7Gkvzq4xrpr8F7kybbrclfTZIJv
	3n5aqvneZ6rP/0ePqXw23AJ8B87Bh8mvcj/kG0gBRP8R8lJ47gEYh/kd3wMBgVQ4Tx83tqJsEm0wC
	UdAh6do+Y3lAbzpUrcTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoDz-0000000CJ7P-1P7B;
	Fri, 13 Nov 2026 10:09:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoDw-0000000CJ6O-2bKR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794564584; x=1826100584;
  h=mime-version:content-transfer-encoding:date:message-id:
   from:to:subject:cc:references:in-reply-to;
  bh=aGiLs5yg7FQ0TEEB1cEWlhJ5ZGG2wgnap42vcQfu90M=;
  b=LfgBZhMLZWHP6x7AwySxgXW3D3e/T6eVA/CUFSSgQ9IYTVwVsA1Bq0p0
   gbtX4zPJIUFSOAuloz967uu2PxYCbSBqZa+LnLPPW7qOPsem0ynAk/i8K
   Z2MBzJzw686zDye7J1S2bEDCFhtjJ5XnBIr5vJzOTl2UWArgUslKqfud6
   dX8SMOL2LLdDLxl5fuPtjiuRn4/44kjqI/F+T10z+RliNC3eBVxNge41s
   sp1YGXwqregkFYwntI11aBT8tDSlSPAIlTpEuk1592nIthEvBj5l+kqSQ
   Lc2DCEJGbGy6M1SCsLn7eQUGkVe0t4RSksq9LQVyY11tmkgmkharpMgVX
   g==;
X-CSE-ConnectionGUID: G4RDakIhRGiom2dj40ZyqA==
X-CSE-MsgGUID: KzZ/FC9rTfuDMaz5LyYbrg==
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="66700852"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:09:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 13 Nov 2026 03:09:34 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 13 Nov 2026 03:09:34 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Nov 2026 11:09:32 +0100
Message-ID: <DMU01RHMAO2W.R0WIEEHWHKZ5@microchip.com>
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
To: Mark Brown <broonie@kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Subject: Re: [PATCH] spi: atmel: poll short PIO transfers
CC: Ryan Wanner <ryan.wanner@microchip.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261112-spi-atmel-poll-short-pio-transfers-v1-1-240ccc868cc3@microchip.com> <179451432977.339049.8591158302502636785.b4-review@b4>
In-Reply-To: <179451432977.339049.8591158302502636785.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_020936_773604_4A47FE79 
X-CRM114-Status: GOOD (  20.96  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Nov 12, 2026 at 9:12 PM CET, Mark Brown wrote:
>> Every PIO transfer enables the controller interrupt and sleeps in
>> wait_for_completion_timeout() until the interrupt handler has drained th=
e
>> receive data. For a transfer of a few bytes, the interrupt, the
>> completion and the two context switches take several times longer than
>> the transfer on the wire. Devices that do their register IO over SPI,
>> such as SPI attached Ethernet switches, issue one message of a few short
>> transfers per register access, so this overhead dominates their register
>> access time.
>
>> Busy-wait on the status register instead of enabling the interrupt when
>> the transfer is estimated to take less than polling_limit_us, 30 us by
>> default, as spi-imx does. The estimate uses the effective clock rate and
>
> How big is the FIFO?
>

It depends on the SoC. The SPI in lan966x, lan969x and sama7 has a 32
data FIFO, sam9x60 and sam9x7 have 16, and sama5d2 has 16 or 32 depending
on the instance. The older parts (sam9x5, sama5d3, sama5d4 and earlier)
have none and take one interrupt per word.

>> the word delay. Setting the module parameter to 0 disables polling.
>
> If this is dubious enough to require the module parameter we shouldn't
> be doing this.  Most likely it's perfectly sensible and we should just
> do it as standard, other drivers don't make this optional.  If we do
> have a parameter it needs to be documented.
>

I will drop the parameter in the next version and poll below a fixed 30
us.

>> @@ -725,6 +736,9 @@ static void atmel_spi_next_xfer_fifo(struct spi_cont=
roller *host,
>> =20
>>  	dev_vdbg(host->dev.parent, "atmel_spi_next_xfer_fifo\n");
>> =20
>> +	if (as->poll)
>> +		spi_writel(as, IDR, SPI_BIT(RXFTHF) | SPI_BIT(OVRES));
>
> We should ensure there's no interrupt handler running or that could run
> in future, especially with PREEMPT_RT which puts everything into a
> thread.  If we timed out a transfer then an interrupt could be
> delivered while we're polling and try to also process things.  A lock
> while updating the flag and checking the flag before doing anything in
> the interrupt would probably do the trick.

Done as you suggest in v2. The poll flag is set and the interrupts are
masked in the same locked section before the transfer starts. The PIO
interrupt handler takes the lock before it reads the status register and
returns IRQ_NONE without touching the controller while the flag is set.

Thanks,
Emil

