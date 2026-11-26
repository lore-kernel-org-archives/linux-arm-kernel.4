Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCBD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WpyUsiDp;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZSd1ja5Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mnppamKzAQZC8IzU5oxBIEXI3CEcCekJ7lGtliYOKEI=; b=WpyUsiDpg9up6N
	B9KryU3WLBMG2Q5ax8hV7KceJwFN6yRVTQGkktezZZvgjdF790lt/CCfuGuzF1eJKagNfkgroov3B
	HKicA0iEgOxVjv/I8EbGbTzZ4nct0ga4wb5fBGBP5J5uJn+nlp7C/fO9/kmwsucjwgIi+I6pVkupt
	i8dGhH7h5L195voGb1qn8J7vML92QbYlyK2kD2Ewng5giKM7s8In2UjSuKTok/BqznzwvXHrNkn64
	9PDi/tvl9ssA0vKmn4HaBN4fCjZ8KroPotRyf1/nkpwdDqRZRd2z9+cvljHilSQp3geU8xDvOx+g4
	BswbCT/GeJxD/BbA5bGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNhx-0000000Bhvn-28xE;
	Thu, 26 Nov 2026 00:51:29 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNhu-0000000BhvR-2DiX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:51:28 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-33fb4680717so1344855eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 16:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795654285; x=1796259085; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mnppamKzAQZC8IzU5oxBIEXI3CEcCekJ7lGtliYOKEI=;
        b=ZSd1ja5YMjmlodYu6fpUMnslw0/hGtk27nlIoeg+1eoRFcZTnFIY08gsjdbof1zDaw
         gncH2deIBlTnQoSsKyDU4I5m7bF2ooxs4sPQZ4h/LUuOZNQ4gnrGKlY3s+/GfxHxpn2O
         Ihk1x6V+QgTlYeKRELSLrW3tDegVOaWBaLwkgDSYtIbIto8x7P2Ju9hZhsySe6AhKV3M
         1dC/5aI4+fv9dMYeFIdGc9TZNPkWfyhds6FDUbTmZwFnQaI9vjSBI+BAlJfqPO3hMRvF
         FEduPbXHKCKgJkWVIuYhY+rxSVaFNmFeZo8Pydw0U2ZzoxEG8VHmi3My90fIvS+az/Pe
         BpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654285; x=1796259085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnppamKzAQZC8IzU5oxBIEXI3CEcCekJ7lGtliYOKEI=;
        b=dYt5DFrWjMctgWJ2OhvXz5W1SjRuOni+Tq+aMcoU2Uw6wW5If6HOC8yB2X6ZxYzmEA
         /jzZ1hq6Wp2oieSsL/zjue43Myd/7fjtTP8VxeQ9gsZk8sUGgIKZHb6Gg/9odxoMeFiD
         i4Z5+IhnOvsHCOngGghVJpbJKwTyzd0LJVjHiIJbBGqv9ckxSLya4AhlPiP37EWhTTTA
         sYCF1BrU7AzEE1/5Zw+WFhplRldC/UC/I5SH7g/DC3iv18jCcSBarBhy1rhAy0S2MCyJ
         RVVCxNmI2aoBEvY3o3LmYWyHiAkA1g7NNN9dquhvNpC1Ne4RqetlwuS4Rqrv1SaW4DWv
         6Hcg==
X-Forwarded-Encrypted: i=1; AL+hErGvwBJxTq838a7n85kc211w6m5i+P3bg14bZJMMKfVA3J4nJMWfBJP/31B3z+WJT3jr/TSpwnH+divRc+NkKusR@lists.infradead.org
X-Gm-Message-State: APuU4Z/H0CWVD/UqmBFMnn/NDCzWFh4KW3qpqjkn6IMChkOK2WvPmXRT
	FdwC/anaBGVtfozpJt3qPQqXtYyshMhYIooCXA+RuvQPApRWzp/cEF9eWoZuDCx7bA==
X-Gm-Gg: AZFdTZfDdEPdKuSOuB1I6qeKDc0F3FXLesgIBlYqUZDF/po384qcIKoHmEriyGHtAYn
	FwBTL86/EGWCJC9LPeRCKHa/8THjFKCL6mKApsichDp5uXULG0wEz5Yk2AKQPHonxLOPg7Jo2cl
	qK6XqcN0wM8cI7I6UnwF9ZuTBMq7wm6BK3z2kf9x1pUVxYRv2CGdYFUoSS3EzvpDEQuRYcoMnqi
	oPJxmSz9HVlngtTgc+oSIZULYkcwq1WO9u1VkOmBqjpogE8u0tNp894gqxekD7oZ9oTU4/sFVBu
	SYykA3Esqbq7vPo/ZmY4OQqE5EIUbcJ9IIlZ4gs7kG9enqplgzMrO6h7BRye2tFaK0InTfWynGs
	/OLt3KB1s9AFBniI/fKIToPrJHGYpeaslCBrK6CcDo3LxqbNvegTB9WFm5NdLiu8y28ARgOLe0A
	LafkJNWfoeb0MmJoApdj/CoRRZZposCKXDrG6HnnQeaZV30r30LnR7I3yOwnwuKLbAHWD2gcS00
	cjLQaxjUbOnbgPLYQf9LACDLqW6ThJQweTbnpmK56U5MGxll0ZOkn+YZoq7FkeqReG0IvMpX/M6
	SNI1tVYc72IOfJxYFD8qMt82whOmX+a/WPGWjEEYsYttiCLUhwv3BZeMAJYWKXbCtgXYDgbNoGg
	aI4es9GlmcgwGgdJRIw==
X-Received: by 2002:a05:7301:a23:b0:386:9ad5:6641 with SMTP id 5a478bee46e88-3869ad56b0emr16578348eec.32.1795654284736;
        Wed, 25 Nov 2026 16:51:24 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm15707184eec.17.2026.11.25.16.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:51:24 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: alex.cramt@gmail.com
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mahesh Rao <mahesh.rao@altera.com>,
	Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>
Subject: Re: [PATCH 3/3] arm64: dts: socfpga: agilex5: add support for Terasic DE25-Nano
Date: Thu, 26 Nov 2026 07:51:20 +0700
Message-ID: <20261126005120.176307-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118-de25-nano-v1-3-473d16131f7a@gmail.com>
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com> <20261118-de25-nano-v1-3-473d16131f7a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_165126_619631_8774F4EF 
X-CRM114-Status: GOOD (  14.76  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexandra,

Thanks for posting this. I have a DE25-Nano here and have been running
a mainline kernel on it with a board file based on Altera's.

On Wed, Nov 18, 2026 at 08:07:15PM +0100, Alexandra Østermark wrote:
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			label = "hps_led0";
> +			gpios = <&portb 17 GPIO_ACTIVE_LOW>;

My testing found GPIO_ACTIVE_LOW is wrong here. Altera's and Terasic's
device trees have the same mistake. You can test with
/sys/class/leds/hps_led0/brightness . With GPIO_ACTIVE_LOW, 0 turns the
LED on and 1 turns it off. With GPIO_ACTIVE_HIGH, 1 turns it on and 0
turns it off, as expected.

> +&gpio1 {
> +	status = "okay";
> +};

I suggest also enabling i2c1, as Altera's file does:

  &i2c1 {
  	status = "okay";
  };

Unlike the other HPS I2C controllers, which only reach pins through the
FPGA, i2c1 is on the HPS's own pins (HPS IO 36/37) and goes to the
onboard LIS2DW12 accelerometer at 0x19, so it doesn't depend on the
FPGA design. I've tested it on my board. With i2c1 the only I2C
controller enabled, it is i2c-0:

  # i2cdetect -y -r 0 0x18 0x19      (shows 19)
  # i2cget -y 0 0x19 0x0f            (WHO_AM_I, reads 0x44)


James

