Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86169606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iapNcxNq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXgMR6ie
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H2Y/M+dNCf7NZhZYEFajE482Mp/N89Yl/EG9+klpX5E=; b=iapNcxNqveGtohCYl+VowUsGvB
	XQ2j/ESpEXdngjzp03ij4IbyNKarQ0z3RfAerLKVnEOEBSWl2ZVU4r+BVzscT0uqmG+mfS9aykXOF
	cWNdmQvKJ0PqxSFQaa0kc34y0FrHUTlCfgLZ4ndzUJ4RRmNQ0W+rGwFMdvu3LoQfQQP6nRcTF7RkP
	aJ5bk6w7/MqJwkvvv6169kwxDCpVEX2hwwQ1Rr5SAhXEKqqe23M93qvI4PAlZAMBd2QJCWH2pH91Y
	fcGwFVIAD95VxSWqnfThK9EdbNmDN+HqV0E3h7VTr/IOUv1NEm+SWTJl5qsLfGLcTQPiBuxnLTXQF
	NwkVke8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMnv-0000000EnQm-1Fy6;
	Fri, 20 Nov 2026 11:29:19 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMno-0000000EnO4-3cOe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:29:16 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso613231e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174151; x=1795778951; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2Y/M+dNCf7NZhZYEFajE482Mp/N89Yl/EG9+klpX5E=;
        b=aXgMR6ieLubKx5W0XCaGKi6dGwXoB8eUkhbX4f8CMu4gQV8EmzkR7Pu26H6HrOze/y
         +BpcEz9hWq99j8+HKj891bHUOjqpxKLhAC1cRhMLFm5vfdA4P6ZM1q7DGspjf9UXlwf6
         DHevW5XFFtmscYbmgSqXdVioFojg7uNp7Bk0PYOhNCplNbNryFgX+SA4JaM7us+Ne1wF
         rwidn7XE14qncnV420nuAmUwStrK13b1yUahqpjdxWkguZJUVChfSo3LcIyVQb7nrJmC
         L3OD7vNd2Phyu0fNRoLfLLL/el+KKOXCrbjYsuMNdl18l+NV864K3970BpuSFPZZ/g8i
         zthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174151; x=1795778951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H2Y/M+dNCf7NZhZYEFajE482Mp/N89Yl/EG9+klpX5E=;
        b=a2Agd+Y2BvfN1YKnePDR3fiu6rwi090PkVDkmqcqCYpE/DAlq55N1pTdN7MQpYsHoz
         09iax5XTfSNAP5CLN7oxLfmyr/aQtxACiz0ANW4cZ1n2zSBXSN8kQWC5EbWjPedO1LpY
         HOkEKbUhIC0BuzPblddri2Grko6OwuWpanVQIvVuLUatBKuJ1oKmlPiMjK6+PQJ/0y+G
         h+X6ypq9QqgEmpSQDn8KevuyQuBoY0EF73GdEi6t+YV3aSHFH9KTJQnwG/LFxvtiUufk
         RgDABSmh2lT1Hw57/9gF45H5JDvqkV1z9z92fPD73Tx1ZQndD+VeUR1XfJ8SCIuA8H3+
         RauQ==
X-Forwarded-Encrypted: i=1; AL+hErGEd7gePBAsHyKjkyECOtW+khu0HphTAiqhD+hsk39uHXOkCqrhxkk8oc0lUcjGMarcVe/KqunJpkokBmnKZz9w@lists.infradead.org
X-Gm-Message-State: APuU4Z9CihjBeiw49qVXj1yRZInbiWBMXXknSVc4dkW99wYHB2oWUhOe
	7pXGBK1G8mc1KTpnRh5/rRYgr3GhePFuTwTAKmPh3F4hJPSj1mx1Mnm+
X-Gm-Gg: AZFdTZflQvS78PjQeYg6i96JuFE57nEsrh6zYr1ekwz3uf6g3jGhuvKlS9ZCmxrmkT9
	KHJMoK54osy64+0k5XCoN7wPtgLajR8yBC30Fus2xizqdr7/R4gma8VR3Et5RgWVY+9DXS2CPwl
	SUjlcTs78UfS1XMeCyICReWetizqsZha8Mx6dBOrN/V1NwFHM2NQ2hwJOzf6LwPmE1zRR1ZB9F+
	Mb8oP769YT3faCMf+l3VUAeJA3WNzdUE9vg6A+ARWzPTHMpY3EE3FvCgr/UQAcu4UWpQhQil2ug
	t4bROAjMYoxekgE8Wk9N8fPcEQOZtuGlYkwK63HNRcXJScucUyiTMZ6f2Z0TTmtT7B3NSgr9qgV
	+gIKCqRkkfyZZ/r9VRRoKYHiApEQ1Oqw/pLnS/a9N06P/txt8KKad1w+akMPen7wQ6r6y7EmylH
	oJOAaQKeKCuGHgFsswJuYMplj5hLZDnNaCH2lIlsnU07bDIcFYyRtcesaezE+sEaNAti4I+RwS3
	wdvY93Dj1KR1LU4//9QaINHt0W0xlTrhW2h4g8DIWiS4ui2thgs109zHTwMkT2QuNT1svpMJwnF
	p1C9p+K7/oHd5Oza7TiNd28wF/phlXHdGCz1Y2QHVx8LO3z8g7xNHqITLNy9zRaV5f2vNBsqww=
	=
X-Received: by 2002:a05:6512:ba6:b0:5c1:ac5a:52e6 with SMTP id 2adb3069b0e04-5c1bc865878mr898897e87.24.1795174150406;
        Fri, 20 Nov 2026 03:29:10 -0800 (PST)
Received: from gmail.com (78-71-189-157-no2450.tbcn.telia.com. [78.71.189.157])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0177f7sm491711e87.33.2026.11.20.03.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:29:08 -0800 (PST)
Date: Fri, 20 Nov 2026 12:29:07 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v13 0/8] I2C Mux per channel bus speed
Message-ID: <awAvA1rSGwh0RaIW@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_032912_950137_E4917959 
X-CRM114-Status: GOOD (  22.52  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 01:01:47PM +0200, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
>=20
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
>=20
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
>=20
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
>=20
> This patchset has been used and tested heavily the last months
> on a custom board based on a da850 (DaVinci) platform.
>=20
> The implementation is split up into several patches:
>=20
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Gently ping on this series.

Thanks,
Marcus Folkesson

