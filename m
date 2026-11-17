Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE45606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fY2gs2eU;
	dkim=pass (2048-bit key, unprotected) header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=Rnfm5c7O;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=CfHVnquw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VYz9U40WK19ephf0M0jjCw8I18eEhFgVrlWaiCcqP8M=; b=fY2gs2eUPVvA+y/ScIaTC8Fnrt
	tMaS4OXVbXGuMlDsflkxVL/FHMhH1jlvC8/YfXVHa6gFf4Al57Ovh9n9moU1AUQ8cIVPu7+DsohI0
	EXqWVpYB0O5ZLewSDGuKR4z5tACHa15n6VR3iIjSXNfDX+iuoY0HyDdMAsrJWx+283qwjNSBk1plP
	V4WluCe7GtujkbyxPnR+4RJ2mdUxmUniefbQ6V6jpoQaxR7AKVrusVLG5TlHKluTKb6NhAB/OsfB7
	O94Ugv01ohM+qfbPRuRypqKJPV32yW59v2IjvVTcFVGJUyMRy34Md1527LYePEkobFeaxJf9gmWpZ
	u6CVZ4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRrf-00000007FLT-3LIA;
	Tue, 17 Nov 2026 22:41:23 +0000
Received: from sendmail-50.purelymail.com ([167.104.49.167])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRrd-00000007FL0-27RS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:41:22 +0000
DKIM-Signature: a=rsa-sha256; b=Rnfm5c7Omqi+qVZSyeZvTs2HsYwCBSu7zSj8NkVkmiHYY8GTdzfAvXFWaizXM1EKcMuKXeu6t9pp6TtefKxLN0GT21PI3vwq0SmjzG/FMrQe6rwdCwpY72FiGyRdGIkQNrCsLJVxR1SIc8+T2ooVJUr4Rgt4F4b38H213y8bi9Y/+XpZK5yRpO6iTyXPPAEpbGsYnG6SUDk9/Pi4zZDAcwEsCLoPT4iQJ17x2HcoY2d4Jbiccss4QpIjjG6V3FqZfv84bMjMcxbMiy5jVE3Hkh1mDReDwx6OqzaEeC/FO5Gq+xB8fYmGqi39VXrAossFmSF41h0ysEH+F12hQstNew==; s=purelymail1; d=sverdlin.org; v=1; bh=VYz9U40WK19ephf0M0jjCw8I18eEhFgVrlWaiCcqP8M=; h=Received:Message-ID:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=CfHVnquwS75szLeOqixkL1ZKuvI7QzGtKeozivf9MzyIGY0Kuf28LVil6efC4xECI7SFMf8GWfCfu2+w5YHj5o1G8md3nHXJqjXz8R9+5nTCADrpMY3Ymwyj8ZECBEBY2XWpfEfNZsUM48TgHe2fo5/xVol95WeYYSPn6NfzKitiYA5JcxCb4nscp+4DD+5yfKQVmcOcTXVukOn8BHT/OYWN7m6uUJXpLtkVZqFHhsJ5ctzShDpVFl7rWlbQ8xA12EPr25TYxDvxFbd4Kc0JrCUJ3JaNtkkRzHTR4VIFkaBnCVRQcsTxMDk2ocD0c6l+zf1ONzYvVOw8BIZcIRpG2g==; s=purelymail1; d=purelymail.com; v=1; bh=VYz9U40WK19ephf0M0jjCw8I18eEhFgVrlWaiCcqP8M=; h=Feedback-ID:Received:Message-ID:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1693380044;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 17 Nov 2026 22:41:15 +0000 (UTC)
Message-ID: <9f30d506be74bf49626440a7f013a748dde3ec2d.camel@sverdlin.org>
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: a133: Use the A133 CPU OPP
 table
From: Alexander Sverdlin <alex@sverdlin.org>
To: rajanyadav0307@gmail.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Cody Eksal <masterr3c0rd@epochal.quest>
Date: Tue, 17 Nov 2026 23:41:03 +0100
In-Reply-To: <20261104-a133-series-v1-6-58217cb33a87@gmail.com>
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
	 <20261104-a133-series-v1-6-58217cb33a87@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_144121_663734_8FDAF89E 
X-CRM114-Status: GOOD (  15.70  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rajan!

On Wed, 2026-11-04 at 22:41 -0600, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
>=20
> Switch the three A133 boards in mainline (Baijie Helperboard A133,
> Liontron H-A133L and Teclast P80) from the A100 OPP table to the A133
> one, so the speed grade is selected as the vendor does it.
>=20
> What changes depends on the chip:
> - revision A-E parts with a normal marking ID get a0-a2 from the bin
> =C2=A0 field, as they get speed0-2 today, with the same voltages; only
> =C2=A0 1080 MHz becomes 1008 MHz. The exception is a part whose ICPU and
> =C2=A0 PCPU values are in the range for which the BSP forces a0.
> - revision F and later parts with a normal marking ID get the a3-a6
> =C2=A0 voltages: higher at 408 and 600 MHz, equal or lower from 1008 MHz,
> =C2=A0 and 1008 instead of 1080 MHz.
> - "high speed" parts get the b grades, with 1416 and 1512 MHz instead
> =C2=A0 of 1464 MHz.
> - if the firmware does not provide SMCCC SOC_ID, the driver keeps the
> =C2=A0 A100 selection, adds the BSP's a0 rule for normal parts and warns =
at
> =C2=A0 boot.
>=20
> All three boards supply the CPUs from AXP803 DCDC2 with a 0.81-1.2 V
> range, which covers every new voltage. Without the A133 support in
> sun50i-cpufreq-nvmem the A100 fallback applies. The Teclast P80 also
> needs "cpufreq: sun50i: Handle boards with the allwinner,sun50i-a133
> compatible" to get cpufreq at all.
>=20
> Claude Code (Anthropic) drafted this change and its message; I
> reviewed it. I tested the A133 table on a KickPi K5C; I cannot test
> these three boards.
>=20
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Tested-by: Alexander Sverdlin <alex@sverdlin.org>

> ---
> =C2=A0arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi | 2=
 +-
> =C2=A0arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts=C2=
=A0 | 2 +-
> =C2=A0arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A03 files changed, 3 insertions(+), 3 deletions(-)

