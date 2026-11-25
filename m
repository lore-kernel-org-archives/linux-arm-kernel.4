Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82953606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IXV114EZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W4jWDdVB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kG3KTIhl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=; b=IXV114EZIwbo85
	GsVeuubJpSwsFnN63FrL9vBeqBpHw3KSuJ5VoADQ9Y1rcYtF/5Z0LrqX0UPTzcfELsM7E3ELjgweE
	7ahxyyAWePmE1fyuyIfb7pL1ZpX2NHAPRurPpG8SbHJxH2PeUnURAbk+3x9Rj036XRGC8If5SZ/Cr
	TjpjOabZZgyb1G6Fyn/7valnajfiGiggnoSmCBXQ2OYNG/6O1JRbgh6zBk4G2qjeZMfoForyv6QTh
	0H928geza8uAL5R3vyjDqpsx/1ZXWDKPAQxPqXwQRCvE9Mn4Jz5aj24QNJ17qlhwcuJO4i9SgVzO7
	0vlD/taBKt6fSlB2O1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB0I-00000009ZDf-12mI;
	Wed, 25 Nov 2026 11:17:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB0E-00000009ZCy-13M4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:17:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mBkM3763913
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=; b=W4jWDdVB1vbwwYli
	084svRdTuIpZGcbEUnPgXFOT3xfX3COpD8NlOSCTDx5vbmO6iqlsSjsyj1d4GyLL
	nVOQ7ZWM8f0DKHclVqbU4ZkP7EVvYnnEXvT3wIzR4iDWx6pNq8Z1BIggEvUuYzO1
	GxNYOiSA7xj39P9WA85R+PuRN/T8BnNtIXrGD8KSW0aoV0KInDxHm0smhmzGphcI
	3lY13tpzpfmCw4yTAdbwxyIy0T27VvXtuE7mzUuS4uPS3QeJ/y1RC2M0RqeEGhwn
	KxzYHwGlf6NbPM8BaVxNMu7AyROhy/1HuLKSIiKuynlR62oYOUOeNrSDq7kvHR8I
	97krqA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2rgy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:17:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so6813631a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795605448; cv=none;
        d=google.com; s=arc-20260327;
        b=oFNqwxBJHXSghcW/37iny8TKX2f9nmJra0o896inhl4bWBZhU0JjN0md7kvXsmv+UA
         0/sXr1TKzeII0thE0RT0dcwSOtjt/e6YgqPaQdc5lLfA4du5u0NhDgGPZMPKb/WZ5ta/
         l4EZGRHiY+duN84Wbs5HHHD8q7D1UDX9HNVI3vzGFftVB+dgcrHJtEIEoYAc4252Xc3j
         78lwzFO4xWE9fVwhT1JPgtDyi1tBlWdmA4g1G03Fvgu02wdzrrQYOLJgbZhW1xs9VfAK
         7c1TT0pZsiZdlzR2JDAH/VAAxVTCQt9THagV5fj8ZniqQfa0p2V70tuVQx6eKg/TXxw8
         2ShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=;
        fh=Lrcd2SYMK3Tktbjms8EL38mUFrrUa9scfwSUUZlxFJI=;
        b=hVLMPveynspHujb94TU4a3Qxo9Vd254wGpil6ya2sglIDaWQmBLLRL8+zY0SDWXTLh
         Z4+t97dKM41kVmn/3IMPdO7L52ETWVI+UTOJxc6YT0KEuiPhLVcztpRrttda579DAn/1
         7qBzWQh6NWc36VOarIPddVTu9lnaFruYnfBsQxpMqHM+wvxI7bny7nBfqxrtJZgczTh9
         npWhqsa0sgOFAb64ssaLWnAMPY5wrYk1FwxKY5p4o+c/sBb1Imnlq+ACkjsDtXGDHSbe
         RFs8Uopftg6PF3Ki6Gnv/XyGFzUo/gkAbLz3snwCc6Z0FDDWU8U6e0e77zsvkcaN9gu+
         boaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605448; x=1796210248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=;
        b=kG3KTIhlyoZw7E+lrsmXpBf9BmUapTUmMRZTA+ML/eKsi3CN2pfJfv4R7gI/ky3Mz4
         ZIfrs8lO90B8V3rwfau34hhM2pk9L9qZP3LRw2rRx5/pTXiWor64kVbowAuMvwxjC6e+
         D+1UGTABiRFs3geTsFHj/92ytJID1elFa+c7HR8ZFtx74hf2fMlQ6y9zkIk3624AIxiU
         zkPeMyWzsEq/eypikPvW0e5/dB7jIMlJSVGf1X6nOzgZthIhS9GIMaOis9mDqo0CsQka
         FCe+DaVbeqPziIiFxagDtPenqO+jeFbwp+tjXM1R3iqmufeEPZRGAlu+UIhduDNTysze
         X9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605448; x=1796210248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=;
        b=1KsIqP5RZCQYbfFA336fQrUUi5e7KXjhyCxeDh1iEAQY17JqjJjDSZ1EiP/4RfMi5s
         e5i/5zeYcNI+QMhOmBL2TUa9EpCczEg/qRhTwQE8qQhNG+KR5pNMrj0gN6tlEGg33o5n
         8bbHXez06KrKryHe75aa9kup4lTbnzVk3PfSWPgd7RF8i5cIvMieTr5fcBdYvtjO2Amo
         B/mqGHSIbQ3UEdezSwXofOR8thkZywNU1xGuTEGAVhS0Tf3uwGg8BbhsowFjfuybHsS7
         6Du/ZblyJupppOJoALikQcagmJoiy5ta4LwwnJhVKpqZJa0oLITVG0QVmt6Pc8+M7Q4/
         wGiw==
X-Forwarded-Encrypted: i=1; AL+hErFbGUHbgTOSA3nSNwSoT8XVmQWVwO4Simfa2x3bdJS1KpjyxBpZL2VQWbG0oLvyBKCeT7HL90uYJ7UsinL0arMf@lists.infradead.org
X-Gm-Message-State: APuU4Z+du8UCUC18SJgv8q1aVOvXT3+6aCvfIr8ldidOrhsOI8jdTaQs
	oRmAw0iX2Jr1amjbgJqqiUVhNHmkaIT/oNNocJjTEeO3AxtgItUeKxB488OCXqDKRhtZejdFILu
	+CZSWPRHQA9irJxViMCnBfbbfQMWRWL853LuH4rR/FONDIr+JFUG50ar7gQsfN6+sHu0h2Yf2V1
	PoIf1Bco4VN0HZCp2RbIIupsA1ZlVqquA4NhR5zeVHTYTEnd9iHnAq
X-Gm-Gg: AZFdTZcVSsMjns6x5As4Wuyhq93FTohxgUqQZw+pmajK9SZAe4AWqfAaicFuvdXmBhL
	vW2AwQaGYG1DOBZgDfVCDTU6uyjjkvLWjLPBPJUanLdF89kkjlXCH+JAR3zViZkXxnMS8Xw10qG
	jIwLDWMNTav2Mn9e/kNmQIBp0AU46dDr+SQwDR3sdB2ppDoNCAA1h5F2EyMw==
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr17035897a91.61.1795605447966;
        Wed, 25 Nov 2026 03:17:27 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id
 98e67ed59e1d1-3b41c9b9dc1mr17035856a91.61.1795605447334; Wed, 25 Nov 2026
 03:17:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <dcdd928d5b89cd0a67bd8c1d3a60cf657516850f.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <dcdd928d5b89cd0a67bd8c1d3a60cf657516850f.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:17:16 +0100
X-Gm-Features: Aa3M54otUsCwPZ0NLSXUquKQv9JCjL7ZJt5maqUuGrgwo9AgbaI_i_khKOzQbo4
Message-ID: <CAPx+jO8EFFeGp5HwOEnQgR1rc--1Akz+ADOoqTjdba6Y8Hb11w@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] pmdomain: Make genpd_get_from_provider() public
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Paul Elder <paul.elder+renesas@ideasonboard.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX3uDairGlnMGo
 2d4UfBF28UibQpcauSIEZw1PsoRYonWZasWfWkR8K3kmVPDPuC/7R4ym/r/BQOmEHPRRWG3JcMv
 ePMQ6xleOr0mCujaWTa1taSGImjQqd4=
X-Proofpoint-GUID: OYwNp7M43D0hiGlt7gwqj1pshyXYi2-R
X-Proofpoint-ORIG-GUID: OYwNp7M43D0hiGlt7gwqj1pshyXYi2-R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX7RKBFL4BxMtO
 rl1P7m5eFD3wwRC43lhrWTKkRs7Me/cIJmqC/ib+BArh1h0sCAlYpFcOoGWXpdAeEim3HVtMz47
 Zv+KJYuGD4AjTEwqlIW26bE5i495bUce29DFxcKinftrTRPWKWDfmNq6GrWnryGRROa8aKDd4bR
 aoZPw2C6ZyMoBK/DOOAW+26nAokF2OGm2dX2X+pEtGuHqNRvj48A453GiRo9lVNmbZVq+1CdHFr
 zK2j8cA6r648bFRV31m/1HL3QbQ3t42EXC9Ag50xyyW5mEIPPEo5Uj3lB6+qeNwdN7IGfqY7mXJ
 OxcncmxfVROAVGXcRcJVkvKL0fIwEq6zvLf9pL8YmS6aBzRisrPNgi0jvHwjic6SnTnHEf9Djf1
 oXIroIrrB0n5aaRpFnyX7xcE7i01t/CRJ9xROfHaR9+e4YxBV3Od6EyWksZePhVBQlNrAel9+OG
 qHZmc6i4oXWyLx9EYmg==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06c3c9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=LDBv8-xUAAAA:8 a=wx2en-tew_9JlkkAXb0A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_031730_408484_E0B26E68 
X-CRM114-Status: GOOD (  28.88  )
X-Spam-Score: -2.8 (--)
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

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike the corresponding function in the clock subsystem[1],
> genpd_get_from_provider() is private, and thus cannot be used by PM
> Domain drivers.
>
> Make it public, so the R-Car X5H Module Controller driver can call it.
> Add an "of_"-prefix for consistency with public genpd function naming.
>
> [1] of_clk_get_from_provider().
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

FYI, this looks good to me. Will apply the next version.

Kind regards
Uffe

> ---
> v5:
>   - Add Tested-by,
>
> v4:
>   - Improve patch description,
>
> v3:
>   - Add "of_" prefix,
>
> v2:
>   - No changes.
> ---
>  drivers/pmdomain/core.c   | 22 +++++++++++-----------
>  include/linux/pm_domain.h |  7 +++++++
>  2 files changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index c242807f62579e5b..2a44b45955dd6ba7 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3008,7 +3008,7 @@ void of_genpd_del_provider(struct device_node *np)
>  EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>
>  /**
> - * genpd_get_from_provider() - Look-up PM domain
> + * of_genpd_get_from_provider() - Look-up PM domain
>   * @genpdspec: OF phandle args to use for look-up
>   *
>   * Looks for a PM domain provider under the node specified by @genpdspec=
 and if
> @@ -3018,8 +3018,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>   * Returns a valid pointer to struct generic_pm_domain on success or ERR=
_PTR()
>   * on failure.
>   */
> -static struct generic_pm_domain *genpd_get_from_provider(
> -                                       const struct of_phandle_args *gen=
pdspec)
> +struct generic_pm_domain *of_genpd_get_from_provider(const struct of_pha=
ndle_args *genpdspec)
>  {
>         struct generic_pm_domain *genpd =3D ERR_PTR(-EPROBE_DEFER);
>         struct of_genpd_provider *provider;
> @@ -3041,6 +3040,7 @@ static struct generic_pm_domain *genpd_get_from_pro=
vider(
>
>         return genpd;
>  }
> +EXPORT_SYMBOL_GPL(of_genpd_get_from_provider);
>
>  /**
>   * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> @@ -3113,7 +3113,7 @@ int of_genpd_add_child_ids(struct device_node *np,
>                         goto err_unwind;
>
>                 /* Get the parent domain */
> -               parent_genpd =3D genpd_get_from_provider(&parent_args);
> +               parent_genpd =3D of_genpd_get_from_provider(&parent_args)=
;
>                 of_node_put(parent_args.np);
>                 if (IS_ERR(parent_genpd)) {
>                         pr_err("Failed to get parent domain for %pOF: %ld=
\n",
> @@ -3196,7 +3196,7 @@ int of_genpd_remove_child_ids(struct device_node *n=
p,
>                 if (ret)
>                         continue;
>
> -               parent_genpd =3D genpd_get_from_provider(&parent_args);
> +               parent_genpd =3D of_genpd_get_from_provider(&parent_args)=
;
>                 of_node_put(parent_args.np);
>                 if (IS_ERR(parent_genpd))
>                         continue;
> @@ -3227,7 +3227,7 @@ int of_genpd_add_device(const struct of_phandle_arg=
s *genpdspec, struct device *
>
>         mutex_lock(&gpd_list_lock);
>
> -       genpd =3D genpd_get_from_provider(genpdspec);
> +       genpd =3D of_genpd_get_from_provider(genpdspec);
>         if (IS_ERR(genpd)) {
>                 ret =3D PTR_ERR(genpd);
>                 goto out;
> @@ -3259,13 +3259,13 @@ int of_genpd_add_subdomain(const struct of_phandl=
e_args *parent_spec,
>
>         mutex_lock(&gpd_list_lock);
>
> -       parent =3D genpd_get_from_provider(parent_spec);
> +       parent =3D of_genpd_get_from_provider(parent_spec);
>         if (IS_ERR(parent)) {
>                 ret =3D PTR_ERR(parent);
>                 goto out;
>         }
>
> -       subdomain =3D genpd_get_from_provider(subdomain_spec);
> +       subdomain =3D of_genpd_get_from_provider(subdomain_spec);
>         if (IS_ERR(subdomain)) {
>                 ret =3D PTR_ERR(subdomain);
>                 goto out;
> @@ -3297,13 +3297,13 @@ int of_genpd_remove_subdomain(const struct of_pha=
ndle_args *parent_spec,
>
>         mutex_lock(&gpd_list_lock);
>
> -       parent =3D genpd_get_from_provider(parent_spec);
> +       parent =3D of_genpd_get_from_provider(parent_spec);
>         if (IS_ERR(parent)) {
>                 ret =3D PTR_ERR(parent);
>                 goto out;
>         }
>
> -       subdomain =3D genpd_get_from_provider(subdomain_spec);
> +       subdomain =3D of_genpd_get_from_provider(subdomain_spec);
>         if (IS_ERR(subdomain)) {
>                 ret =3D PTR_ERR(subdomain);
>                 goto out;
> @@ -3491,7 +3491,7 @@ static int __genpd_dev_pm_attach(struct device *dev=
, struct device *base_dev,
>                 return ret;
>
>         mutex_lock(&gpd_list_lock);
> -       pd =3D genpd_get_from_provider(&pd_args);
> +       pd =3D of_genpd_get_from_provider(&pd_args);
>         of_node_put(pd_args.np);
>         if (IS_ERR(pd)) {
>                 mutex_unlock(&gpd_list_lock);
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 14e0e346c610a9a6..d65ee8b3725c1bcb 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -467,6 +467,7 @@ int of_genpd_add_provider_simple(struct device_node *=
np,
>  int of_genpd_add_provider_onecell(struct device_node *np,
>                                   struct genpd_onecell_data *data);
>  void of_genpd_del_provider(struct device_node *np);
> +struct generic_pm_domain *of_genpd_get_from_provider(const struct of_pha=
ndle_args *genpdspec);
>  int of_genpd_add_device(const struct of_phandle_args *args, struct devic=
e *dev);
>  int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
>                            const struct of_phandle_args *subdomain_spec);
> @@ -501,6 +502,12 @@ static inline int of_genpd_add_provider_onecell(stru=
ct device_node *np,
>
>  static inline void of_genpd_del_provider(struct device_node *np) {}
>
> +static inline struct generic_pm_domain *of_genpd_get_from_provider(
> +                               const struct of_phandle_args *genpdspec)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
> +
>  static inline int of_genpd_add_device(const struct of_phandle_args *args=
,
>                                       struct device *dev)
>  {
> --
> 2.43.0
>

