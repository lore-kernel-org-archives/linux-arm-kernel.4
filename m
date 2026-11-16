Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F92C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fkJT1wnW;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=kY/1Xfsr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6zLq5fm3OmZRvOt3lyD6r9AW3NWjUqASxeSxrYrs2BI=; b=fkJT1wnWUfygYk6YRz7Q55rF6s
	ZC1nFvq7SWfdP50o8fnQmyseUX8mYaCIy+VTmVxfHnclYJd9tYxb2S5Pxc1gq9WCGD3N/TAiYWLUD
	9yolIWzeDFD53lNs8DTIs8NiupQOIXrKTeRmJoaSAOCFRNmltlo9a22b2lH8XcOBQ2q1y1FTOOO2q
	JyWrwwdXeH9LUP06YUCeEcsTTpKTYZeqath+kRjIxLFp+nVxzTASw5jyErqw33CTCKz2DoP15XR1u
	1bKGrk/Wr1B60aDFNyErov1Pt6CpWT2OdD/NZAg1DQcp4lrXpXJV0DTE5lLMR7eSp/mKZI+Bxkxy5
	ztN0wiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSryv-00000001Z7E-3blw;
	Mon, 16 Nov 2026 08:22:29 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSryt-00000001Z3q-0Mwx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6zLq
	5fm3OmZRvOt3lyD6r9AW3NWjUqASxeSxrYrs2BI=; b=kY/1XfsrFQOr3WDOyqw+
	BL+DpZczzezRMyxqyf9OH83LcdouDCP1xAlUsADWy3VQQ05SwrYUo1ADp/Go6AFA
	VBgRXaVE+2xBIrpsXOwRn3GGMn86wHIhKSV1f8JpfsgoZX0tDqpUkQSjDaktOYPd
	IfqOVQLe4VSglZ27RfzoTwI/fu8lnfxcRBEPDC3RXAm0ZhD1vG60GDjUdPy5sSxb
	S1uDmBwnEUWdtvDPNUH+JpM5NLAc+3T9T/GDLGmDfcYJe2QntA1c++ddmIV49kbd
	LqYdLHiHnoldnzqrQrLTFjBYRspF54oVVay4gUsDPExcbnXW+qh7uFHZmiIUBobE
	uQ==
Received: (qmail 1194710 invoked from network); 16 Nov 2026 09:22:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:24 +0100
X-UD-Smtp-Session: l3s3148p1@jrU8emBg4qoujnv5
Date: Mon, 16 Nov 2026 09:22:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/8] reset: Extract __reset_control_get_from_provider()
Message-ID: <avq9QEAGR-C0EZuR@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <7df36f036d72403260a51491cd6c3d387f0dfed7.1792163045.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7df36f036d72403260a51491cd6c3d387f0dfed7.1792163045.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_002227_425567_D60B4AB6 
X-CRM114-Status: UNSURE (   8.83  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 05:55:42PM +0200, Geert Uytterhoeven wrote:
> Extract the code to create a reset_control structure from a given
> provider into its own function, so it can be reused later.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


