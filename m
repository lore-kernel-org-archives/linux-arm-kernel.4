Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02B1606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U7lu2BoM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lyi3cHmk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+kg3sJyrWiN7gMrxc36gXdNHPipsqqPLkfF8CSj/v4w=; b=U7lu2BoMUFMzgD
	FhzRwCNavuE5zgR2tDGG8bThUq0zgfC7veOdlro7gqVyFrRY/Irone0608NatNTJW2+Tq/ouBuX8t
	42wVJ7YOqOUMbGARr3py6YcvNnjNaxtcbgziaVbUlnPmCi/orG4lg/zKmsHrOlcZ9nT5QuCn2T57s
	dQvJTg/5z815ikV62Os8ijzf+jYzvukAdCV89O7FnLKbIzH6VoBgCaR/VhLK4Pu0TW0t7rVZCKj/b
	/iqkNh3xo4lhuNrlpIKX9HGggUNMgtmvdSiWqFxnSqYHqDA2F31qTtqgJEYQfF/AHxTnGNkdKSPFn
	D/Dy2YDXxvmCM9/Bctbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGrU-00000007y7o-33Sj;
	Wed, 11 Nov 2026 22:32:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGrT-00000007y7Y-20Y2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:32:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E99D8437A1;
	Wed, 11 Nov 2026 22:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E42F1F00A05;
	Wed, 11 Nov 2026 22:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436330;
	bh=+kg3sJyrWiN7gMrxc36gXdNHPipsqqPLkfF8CSj/v4w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Lyi3cHmk9Kb947tH60tQCzm27MFsO9vwBaU8pNf7xbt04XBBM5uL7DqTXu87dN2xM
	 0O7K16NOM7jP+Po60GJv1nK2Lm/0l+ded+PwnwGU52DVa/n/sIDHPXb7IBko4JHh+S
	 h1JsorsEYJCmyZlaWVZzPxqoT38tOG6Dg9KTQCpfJ2v9XVOIm071nJEvH6Md/NKBmy
	 928Ba0Y2aOXHVGjKlJzEW15KqF43jaqErXyWrctHB8PHVyPxbtFbUKnDym5w0dM+CM
	 6ln3zdnrcGK6rD+xVzi4QdHr/kdABru9jB48sF5DzJJHATk7pHhvTL5GcaoPlFxJlQ
	 rdVMJpRJPcWsQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 8/8] dt-bindings: stm32: use reference manual names
 for ETR and STM bus clocks
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
Date: Wed, 11 Nov 2026 17:32:04 -0500
Message-Id: <179443632478.1143992.14086932638988907034.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=932; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=rHnRVNFydzfp9V/ZzkrEl9hj8fg/pgKMijQaqe2JJGg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+vHkm/kj/8Mp8sT8i8z6wnOu8sXixwU7/VVWpf/OWL
 5n41vVlRkcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATMTnMyHC3dO21X2/Vr9np
 LJmVevrLxNzc13t2f1ojaxBh5mB98vEqRob2ZxPO7pe/FTGnSWhZloKaMXeo9S/d4k/+30PvtGk
 tjuQGAA==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

> The bus clocks of the STM and of the ETR are identified by CK_BUS_STM500,
> CK_SCMI_STM500 and CK_SCMI_ETR. Now that their kernel clocks are
> described as CK_KER_STM and CK_KER_ETR, and as the RCC bus clock of the
> ETR is already CK_BUS_ETR, these names are confusing. They also differ
> from the reference manual and from the STM32MP21 binding, which uses
> CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM for the same clocks.
> 
> Use CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM, with unchanged
> values, and keep the old names as deprecated aliases so that the
> existing users are not affected.
> 
> No functional change.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

You acked the other dt-binding patches in this series. Can you take a
look at this patch as well?

The other clock patches look good to me.

Brian

-- 
Brian Masney <masneyb@kernel.org>

