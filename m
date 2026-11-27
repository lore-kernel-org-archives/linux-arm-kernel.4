Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA152606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XkEGyw3C;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=jrjLNw6e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kUqYMnBcsEL1do1DUDscVdbJ5Tov4SvgkfladUfWF4w=; b=XkEGyw3CoZgU+iBENdlcKSb55V
	kkxaQLphh4VYhIAOYX9/CjxVAgJZHJb5OEQ34LtUBp6LjDKrbUxZkEPJ7xS4xD9tWIEvdz7v8ULld
	P2JBo9WR9kham0HTVf8dabiqdFFVi/ygQ668zMOOeSAi+sTARvo6w9XZ61ekABYysvaUT0IYxqyXT
	cd0x/TeYlHoe/+eCOIGQvcdvWLQbR5Rzz9xlgxG28rjrxJD3IqEu/VUx+lLA3Fw8OBLr3R1fr0R1O
	4k/JghPtCrOXI5IqIcLRRuuTZ16yVO+odGTR9iQufQNpNAgdKlR4xOZ31ytSpxn37MqRd+XdmelWQ
	R/C0ZH1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtAX-0000000Fbf5-0jAq;
	Fri, 27 Nov 2026 10:27:05 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtAU-0000000Fbe6-0Ugm;
	Fri, 27 Nov 2026 10:27:03 +0000
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id E59604C984;
	Fri, 27 Nov 2026 21:26:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795775217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kUqYMnBcsEL1do1DUDscVdbJ5Tov4SvgkfladUfWF4w=;
	b=jrjLNw6eKElCiN4pO9MuTqz/brZEVVk50lfZTJGsbjjhfzMNjajs+kMzEnEVr36UQaNPAd
	nOEVLJ/M88JLlyCuIwSwXUu1ZA3PQ+EYdmUkNGwKDkwtr9ak9HF6T3Kglac/NWdbYjkZtH
	q5DMdp555iyOcUuG7vBJ6xU3PLC0bmtxq34fLN1dHPnt/R6jRkYql8jlkMdu+APeIKs8PN
	I48OvspZvXO66wJQsL5/HBg+29IGL72D/fKTKFvzxdmcFNlid+WwZbJ/xOjHAKeS5/WQh2
	BKVKyuMuRMywRRF5oTv4sFzNg812/uwlOYeHNPeFwqAfcSt92seyXrCPt571jQ==
Message-ID: <645158cb30c2335a6f3d301d7ecf0aaacc28df5b.camel@d-silva.org>
Subject: Re: [PATCH 00/11] arm64: dts: allwinner: Add Allwinner A733 USB 3.0
 support
From: Alastair D'Silva <alastair@d-silva.org>
To: Andre Przywara <andre.przywara@arm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai	 <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet	
 <jbrunet+clk@baylibre.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 27 Nov 2026 21:26:56 +1100
In-Reply-To: <114b03ba-914f-4494-be12-d967be62da00@arm.com>
References: <20261127073231.1776847-1-alastair@d-silva.org>
	 <114b03ba-914f-4494-be12-d967be62da00@arm.com>
Autocrypt: addr=alastair@d-silva.org; prefer-encrypt=mutual;
 keydata=mQINBGactvoBEADBFM2HqfQUUM4j40ZQPyYzmnM8S6zrycO0ipDDPMs7nZMzyzGzOdqfS
 VB/tuYvZOOKVWzJuWJ5aT/YyHx54r3L+D5hTkEG0sXPVJky3yTS9sbHEMSLBHb8TVVuhPVPuieV4g
 Nkqg5POMTidk8xAw50WpV++tUlewXVSciehnuCQPXhXMP7FcCh4uO8LdN7E8m7ir1LafKTFfoWPah
 KVT8NGG9r+ucrFcN5F+VnHxTDaI68yRPkNdtUWmp22wIX1KwDCtKFrndYO4p5Hv2hlDKomsuIIHHn
 muQGRwuh0xpf0nVJNF8ETZHMzxQLfo3e/HvxBFOTkwY9w7CuuQFZchbhS0I3PfmGT0+jiNcdfqjDC
 fPPB5uhy+DkR6wO72vuwFYUrpU2mdliDSdKEtWBHulnXMJjpBOXetfIwhI8G2dTVg59lN5i9DvJZc
 7y1Sp+qfZQ4P9qpYZyQEKR4GNDOdnm6F2LW2cZkcyAU/Ii765zdDMTQMIzZNSxT/FcDd0K1voTNRl
 QHbQw+kmIMhzSv2JefcC9oNbE0XYzcBDNP5T3O/4itOQ90GCKQEPAbIPeBjlQif7kkyvo/H6yv4s9
 duuK7zbJD9AID/+KGLkpU3p68VDB/C2ZSb9rQz3p1CJNSfsX/CPk7sPqA7RKZ4a2B0hSJ2pJCncNZ
 KXtMlkkm/FmewARAQABtCdBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz6JAl
 EEEwEKADsWIQTQGemDFwqYyU/dBWv75AdnjVo60gUCZpy2+gIbAwULCQgHAgIiAgYVCgkICwIEFgI
 DAQIeBwIXgAAKCRD75AdnjVo60qHZEACJnLfpS71Hk8bX0CLCNJ5wgqdZD3pBHEdbv9Ux9kRlZp4a
 ZFwlg9ltwBjl2dZP3PLtD9xQdsdYKVippKd5a7ZZC2y81oDaHjeC9LnPYn8+ce3mGE/+gRyoNfToY
 N06DeUNJKSlZ9t11UIqZCgfp12u16/Yrigy8C4ihEeHXlLhNX6JkeJR5gsHXJnC7vSuMZY+Qz2R72
 ZidWg+cd2WDMGop5sbTvc+55q94A7vTMlWzaix5HdbEUA3sd2U0dMBju5QodRGGhDQMcCu64TydRD
 MtMzzOk9ThJ036ze3HASWGOppyQmaw58k+XNzbHlr9Sc1LsFUNF7zpWXac2rzlywbyRAdFIT/TC76
 hy9zOkwIo2nwA/tdIwLx1j0UZPpAMQmcDUvJqZh6sE+fv6HN0yMPr+sSYJmriMt8Z6leCEHQXOHVI
 SI5z5FvV3coMmHYRq6aXpfs/8SLiYgkV3B0HE/E18Y3j1OkeLYoqIH1VfzQZeCSL/S77NYvk60/MV
 1HFSyqLdUR3uWZI4uZzoEcMoB0GX33uCTp2Ntc00+wSntwekCUQLCMLUb7dZrbpVuobHoWWtkiD2I
 uE5kAiaVwwwzM0BUwiM6VzVoKbeECz93rdsNtwoDqM0NtzoISC46H/BKVQ9mRNXDO4ThEBpJ4H2Tn
 mPNRYYcR0u2mNy1EJII04w==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_022702_310451_EA26A88A 
X-CRM114-Status: GOOD (  17.37  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 2026-11-27 at 09:56 +0000, Andre Przywara wrote:
> Hi Alastair,
>=20
> On 11/27/26 08:32, Alastair D'Silva wrote:
> > This series adds USB 3.0 host support for the Allwinner A733 SoC and
> > enables it on the Xunlong OrangePi 4 Pro.
>=20
> I think you should step on the brake for a bit, sending out (AI=20
> generated?) patches like crazy is not going to make you friends with the=
=20
> maintainers and reviewers. At the moment we are trying to get the basic=
=20
> A733 DT merged (for v7.5), so anything non-essential has to wait. And=20
> the list of out-of-tree dependencies below already shows that this is a=
=20
> bit early.
>=20

Ack. It is AI generated, but reviewed, restructured & tested by myself over
the past few months.

It's been sitting around on my drive for a while (I was expecting to enable
U-boot first, and that got tied up with reverse engineering the PMU,
but it seems I got things backwards).

> So I'd say wait for v7.5-rc1, which is probably going to happen in early=
=20
> January, then you have a much saner base, and we have more time for=20
> reviewing more fancy features.
>=20
> Oh, and also: please try to look beyond your particular board. It's not=
=20
> just the OrangePi 4A that is out there, we have other well documented=20
> boards as well. Peeking at their schematics should make it easy to add=
=20
> the respective USB nodes to their DT.
> The OPi 4A is benefiting from work of other people as well, so it would=
=20
> be nice to do the same for other boards. It's fine if you can't test it=
=20
> there, just mention that and others can test. That has also the=20
> practical benefit of keeping the dependencies together.

Sure, I was not comfortable with pushing out untested code, but if we can
offload testing to others, I can do that.



Cheers,

--=20
Alastair D'Silva

