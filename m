Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00C606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C2g774fF;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=FV+bHprt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yhn56oJr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vf5yNidlEa+rFU9C3BVI0MM4tRR53gAKOOYaK0pBN2o=; b=C2g774fFLKEcDboWjMMNPxlalz
	whgzHa7CHuzR7PUtSYl1ggLh//SKxyTdVASpEDZbSxpBs7gaVXnJtsgHtgkCtuvlc59jcbA4Vwu6H
	H3ndy/HcXgITjXLctgi1XiMGJsKqNRs2tqjyukoIz8UYCVYvYgVb8ovBH+qFp6tkxBwQ2JklnNInX
	+nQH1aKpeTFi6zWQOg1iFT68yyQcUn+Zm8XFtcz1Q6WNloxwUTbXmx7+A9ik7FSRluxAcNwTRIoho
	4/dUPZeAwOUad67BHLHdzXrsbtYBattJPGwdXDoDNDlreN27RPAIOJynETJG2z5wNd1uriIC/LBc+
	pQNNKKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjeR-0000000H8IK-2gaS;
	Sat, 21 Nov 2026 11:53:03 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjeN-0000000H8HI-3Ody
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 11:53:01 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A96807A0324
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 06:52:56 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 21 Nov 2026 06:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1795261975; x=1795348375; bh=Vf5yNidlEa
	+rFU9C3BVI0MM4tRR53gAKOOYaK0pBN2o=; b=FV+bHprtVjMGB2S8RcLRQNQDn9
	bZdh+OR7HG23Eg6iylzbnNjXbSLUhRtn7ZpFMYTx+R1bGmzxPc/sBDgE4qAeZuuT
	ljl7aatyY3m3OlDdDOOZ1HL6iBJPJPcIGcw+aEPg6pSzCZWjUqJ5FmGc0sIfQxqo
	/MgFJVLUyZhDpEp+JuttdPu218/+huqi/7VoVwxETi6JMzYZnuLYsDy5jdh0xKuA
	UyBLE2nZR5wiMJX7Aky4axoCdnsmJgBrFFSjogUefe4Aa6VRkrcjnbi718vC+4Is
	PxnUuY9PbiwvU6odlizUE/IKbTEFPICfYBFBFTUbm0jN+d9EtWJvX4NHqG2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795261975; x=1795348375; bh=Vf5yNidlEa+rFU9C3BVI0MM4tRR53gAKOOY
	aK0pBN2o=; b=yhn56oJrEzjDnsdu/l3J1BAmPI3UEVBkOImzk4xKA8wXJkRDMeZ
	pYiFZIoZM3BiUdrfz9rSGSi41D0lRDXnX+TzUpfI5Ehs0PuT36m0cyKdvl0zBODq
	HlRJFIg65GAHRkqATI2SvJ+7W8+C/5f72Jd/WAkIs1vePt9DXOB2ceBFGFrtOcI2
	MnXJ5neKdLu0uViuRuVM+GA27LfcZExBAjva4Mr7b9N7jJ8AOSAINYATvhLFEJft
	xv9yWyUaEa1ABsyMW+Ii1l+RZIF0gRszLx13ZsSitkrr2IdpF30VqswWVP5Sbcew
	vbGbJq2uLmoEe4VwGb8xFnPWuApfIG68uhQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795261975; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:WZ4vV+4hqDkHLpvFFTkcGq2kX664okIqdygnJ6qp8kgC5NF
	l08ZbQmOeYMP090ih9hRXQmxYEG7FIzcDoAyFW/dmC/kL2bqfUaZ4SZNvc9Hj1pq
	xAyL9BRT3YwKBGclKzr4YGjEtrYpvAI9naLkZnOgJyCn2W+x2UkL5AQ33vmfAKaM
	3opF+qeqx7S8ONkiuyzwIs8MdWZGNVSbWzFurOTznLAc+KKXDBBoWVrDQ+ONosVN
	2sHj5KObDZ4vRIhT3McWdZRiNcv+xksmyqpsb8PF95V3wekiCm2M0mz8kUwa34mM
	0rl0uEn1Z1zCNGKK7D5GV0wxAtOpVWFVWkBU5iQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PllbRkZUG5kqS11BHAzi7Gauwu+Tul1lkzhnOroHy78=:Y0U1brNihjDI0zmj+e0NOmljkQ36GWR80sjuK4SJP94=;
X-ME-Sender: <xms:FoYBazJb02vEQArLE73gHOfrJZHzcsyPLDR8-aJ9bW0whXi8H-abDg>
    <xme:FoYBa-uPlpFVaLJSweu7cjdQryecnK-EiDXSgMft03FZy7jO4W7PeNmpW66fktOQP
    JkDrGlsl4ZiEWMfn3xowHn6uxITulwg2-t7RJzbdl0rIxKA_RHjE4dO>
X-ME-Received: <xmr:FoYBa7Vzt9PGb-j7UxZI5KfnddKw7pD2eVpZzIF_GZnvXq5soKOUo5l-NCrEdTmv_2FU699ljWH0Bc6kKG99lbPWcfHHoSVYpTM>
X-ME-Proxy-Cause: dmFkZTFE/iCAR/qJY1Oq9ehUAbZRcRuEB44N0ZYXPZcCNO8pC2g2/wBbtOpAQuaTZgK70W
    xKLm/wK+/fyJtgak4tomAxv8Y1XuWiITTjpY3AoRg3NDOtWYO3dObYAw6kyZHnjShp4W1z
    W4Rd9w6lREJDTZKjD3qisRXJLAWNLrq0qqgqXRbPQuFhCUvdQ5aZulYouqamUdQ8TpZ38A
    rl9ZbOsdG3k+z+6rKgAhZwjCRyTO6+wD58HRvk1K8eVcqIoo5SMzei4hN7MTFp9DaLl/Bk
    h8k805wdD+QtvsCKbjHCsVTZRORR223mnvwPr6v90KvUks/A3YitkE4dKqLze7GYH2oosb
    cvWl3TuBkBYsbCkq0xVPV1CCUNTteQSKEoHskc9teXXYZfumL8NrtpxQzjAG37H24tLcIJ
    NuqQT780v7AgME+wMTQFtRtc8Qg1Fg/XKL4HaMLoNlR/8oMriOs9Upqck1DgLnqeRfuQox
    PLoZOkla0SBhI/Tn+ONfzTssWlS0TfebbkDrs1ghcG4fC+RnlfBaWWke4dYNAfIoYiAY0O
    lqwG9l4Eizche5BbFGeM3ED6Bd1pE0ep4bQI1wWWE4TBwiWTkIVcGbAOC2JAx45KROI1MJ
    rxSPMQQHmPqQbUDtY1m5VIFvzV2OcmqY6uswsP+4C7CGcwcTLBtNhYiXTuFg
X-ME-Proxy: <xmx:FoYBa5JBoEt1NktQEeUlTj9FZq8XE2-UE6Ohcb1cA38NPrZf4uedOQ>
    <xmx:FoYBaw-fDlEKUXoopB0j9KXJw81ZAYpajMN16WOWEZ4fKfac6TZcEg>
    <xmx:FoYBa3Nxeyl1RpGWqscv0oUkRP2LoCXYR0UbfTvIK--zfLtVgtQGag>
    <xmx:FoYBa827fFffiz8YY99o9dlC2yJqeBjNtF4yEH2Y08hPdX0OAgCqzw>
    <xmx:F4YBa4TAoJAFaTeVXe1PjjV-M9TcG19Jr5ZAok6slITaOqkhMTj9kJvc>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Nov 2026 06:52:53 -0500 (EST)
Date: Sat, 21 Nov 2026 12:52:51 +0100
From: Janne Grunau <j@jannau.net>
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yureka Lilian <yureka@cyberchaos.dev>
Subject: Re: [PATCH 0/4] arm64: dts: apple: Add CPU frequency scaling and
 OPPs for M3 family
Message-ID: <20261121115251.GB515128@robin.jannau.net>
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_035300_427478_F140F825 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 11:42:45AM +0000, Michael Reeves via B4 Relay wrote:
> Hi folks,
> 
> This series adds CPU frequency scaling support, operating performance
> point tables, and asymmetric CPU capacity values for the following 
> Apple M3 family SoCs:
> 
> - T8122 (M3)
> - T6030 (M3 Pro)
> - T6031 / T6034 (M3 Max)
> 
> On T6032 (M3 Ultra), the cores on the first die inherit this support
> from M3 Max, however those on the second are not supported yet.

Please duplicate the values from die0 int6032.dtsi.

Janne

