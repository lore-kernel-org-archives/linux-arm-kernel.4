Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8345B606A68C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IpprH9hh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dt57wqW3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=; b=IpprH9hhipfj/4
	v9CwhSEvo4X7outOdU+uPLXDEUb1OH0PCcL8dOOuPNjGGreydDMKRXlHUvFHbcfOxNRdrDVYvYlNW
	GJHfZ/BGIs1HxW8MIHkdGxYG9ivu2yp1lHzriykzQLnOTU7n7hEdSF2EnWuxigPnSgfwsklX+9eZX
	q92n9ZOpPUUIrnjnuaQIgqetoga9pVFxlqHwHiWWeetcJkkTnofSEN0navoGMsqTRLLvRvtd3yyPO
	92WMRjwiy0izZGoeu7uRvJgZBTdZLYeTkf9ambbGfcoq+ovyyiX1dGw5zi56IP3N3a1mGz0MtpT05
	N5ybrRQsSd1bV7hD+1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Lv-0000000HMvw-2cf1;
	Fri, 27 Nov 2026 18:07:19 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Lq-0000000HMtk-3TfP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:07:17 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-4b8587b395aso4795528fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802834; x=1796407634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=;
        b=Dt57wqW31T/ZTzFZjiyQYFGPNRxTUIBgnuwh+dJHxoyFC54Kj+uijrvLU1yU/JoL5d
         pFELd8rE2dhIeZnmqeUADU3A6CkkPcFh+rp/5Eu4IKjNgYuItqgVHz0icmN/lFJO9jbp
         n++FL5F/yITOz5rBZCyCGOott5KRnUqog+VnrMvFMd2szfs1C7qWmnBQ/cyoeNYhzO0S
         4WNOkjUreGaZbBbOGWvYji5guKRIZea78S4bBpX+I18/LcxHuA5QpMFzK3+EQI6YmLW4
         2SdKr0LX/YfOBcpQBmienSxempf/d5hrcEteZHZvkvp8rfny8mGBvaplhpzgT6TeJoJ/
         QOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802834; x=1796407634;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=;
        b=BsAfre3PdwQwq6gLDvXFrfi6BjqBqOjo/wZp8UFGBZXI3uxhItzEfdCU1W8ihxY03T
         poZtET2n1oFhyh5gHVrWlr8iJaY/klaS9+Bsy+kbcwwzGtcdMSTrDegP8fNRFo42HQqb
         MNjM5awcgXTdt0yievolmCcfWCTQ4bFf9ltAWm4nJAwQvL91ASFD6JLf0BIILI3SNb1e
         f2E7irdgYPSSaZYY2nm5qkdcIPgjYv/uWzy+vz9UiQIDFt9ptoCRfnvh/crC7nC+hNi0
         5LpSmNEyFPZXaNwlHvBvHm8VCnU8DregFY1xQGZdvIjpvj/nlA6Ts6tzpqZA0U0YQl6T
         DmiQ==
X-Forwarded-Encrypted: i=1; AL+hErENi6ly9Q2jZ6RnauV812OReh79haB02CBz+KdgM3/r+J5WAfyNxWxfBtzMEnfcvaQnTND3cKDrQsj4bDhxfx8K@lists.infradead.org
X-Gm-Message-State: APuU4Z/UYJSQ6WGOAJJVCdY4f3jBfsN9Nu37T8U5qIhWk/U2U7fZLk2f
	VcR6DbUaa5yahQBklOSwHJNu4tlSqDgQQ6gm981wgI3LiigC60cRC1UT
X-Gm-Gg: AZFdTZeeyWqYa+xxAuO5HJDuZMn+spSj1eMFW0OWDTumPs60ak+G923cMlSBYDYwi+X
	6eYdb1+EJmxtwgkm/rJAyi4ibeBCpvgSJtn+DN72mL75Mn2rg26UCe+zScGNuaCeNdMcbGKEsWJ
	5BbeCRMnPawtzrow8p5X6OnjnrCtbIWBlOkN3QURn0gB1xbZAAdk1jvOA5jeN9+HqfK8oNQ83Pd
	vfhH8NnyfAJx6zRmbVkcq8x++hPstotwnOFKJ4KvYSw5lR+0k6GyGDbXGU2vdnf+MwjrCXbdMGY
	fa8lHuXc9gKl4Bt0zMsB5ckjW2Et9/t6CbuxC/RLK3WgbGdZ9fppbWY1uCurzXvLpVivnBinu09
	xnoN90Vw0CHikYrdkYOZDAqxFjN1ViF6/QWPEV2bd++aXfPdi5QC6IXSR7/gechVMc07kcpf4LE
	4WdywRLtaG+qqateLESXJ5RwdZZocho6ZE1Ja0BvSnZD1EUfflEp6lekYlf4wZk2+MnEW8vfKET
	ZrCNrtGAeiBFDPKx1+LdqnL3v1UFA8lpXsAUCRpVKQ7iZ2jQv7M0WeK/PA9z5ewNYTyvOvH72B6
	fn6vn0Tbrre7HjNWr2qwZID+4KD9KUD++Fa5iM1XP6AxXSQa8pRkXPrBK9sl9w/zoNiDxREghvm
	lA347RqrXqh/i0g7kCLvFR1t6fgkI
X-Received: by 2002:a05:6870:440c:b0:4a7:6dc:af5f with SMTP id 586e51a60fabf-4bc858f9583mr23176950fac.53.1795802833555;
        Fri, 27 Nov 2026 10:07:13 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm23406139fac.16.2026.11.27.10.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:13 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 27 Nov 2026 13:07:11 -0500
Message-ID: <20261127-a733-dt-v6-02-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_100715_013607_F478FADC 
X-CRM114-Status: GOOD (  25.69  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > +			linux,default-trigger = "heartbeat";
>
> I don't think we should have an LED wasted on a heartbeat when there is
> already a controllable power LED. I think a second LED should be left up
> to the user to configure. If they want, they can always set the
> heartbeat trigger via sysfs, although I'd probably do this on the power
> LED instead.
> So I believe there should be no default-trigger line.

Agreed, v7 drops it.

> > +	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
>
> Since the Allwinner GPIO notation with bank and pin number is hard to
> read, we always add the pin name (PF6) as a comment, see other .dts files.

v7 adds /* PF6 */.

> > +			reg_eldo1: eldo1 {
> > +				regulator-name = "vdd2l-lpddr";
>
> So I saw the same issue on the A7A, also with LPDDR5: the schematic says
> 0.9V, but at boot time it was 1.075V. The kernel corrected it to 0.9V,
> without apparent problems, but I didn't stress it at all, so can't say
> whether this is stable. Various LPDDR5 datasheets suggests VDD2L should
> be 0.9V, or at least in the range between 0.87V and 0.97V, though in
> some configurations it can also be tied to VDD2H at 1.05V.
> So we are none the wiser, I guess, it would be good to figure out what
> the PMIC reset value is for ELDO1, so to know whether it's the
> vendors(?) DRAM init that deliberately programs EDLO1 to 1.075V, or if
> it's just left untouched.

The reset value is not in anything I have; I have no AXP318W
datasheet. Reading ELDO1's control register before the boot firmware's
DRAM init would settle it.

> > +			reg_swout2: swout2 {
> > +				/* VCC-IO to the console and microSD. */
>
> I guess you mean "GPIO headers" instead of console?

Yes. VCC-IO supplies Port B, which goes to the GPIO headers (including
UART0 on PB9/PB10), and the 3.3 V Port F path for the microSD. v7 will
say "GPIO headers".

Enzo

