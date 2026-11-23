Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4685606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q5VfcglU;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lPaSgucv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dtJzmPmb6Nwh3H1c2+/p4meqTnrmRahlnsNzxrgnr4E=; b=q5VfcglUNpaCGh7wKtaSRVepE3
	OXoV1OCpDAsAmGcqV46TTR8onD3IHev67XB3qcLxTxoHpsX9O99Nf3UVombQLBjR/OViY8ufyllh4
	vuyfeJQSz+LJYVK73JcbZhIcpj5a2vRD8Dz9Zz//TkdrgZbs0G8hV+7leQXLi8orpYEUNfkQBdhA0
	pz1EFXGZVTCXV+R5GJsl1tc0ev2oTYQaery28izCj0AYf+6AcJCzZaB8iqqo8HGg3KFFho3t/qNmr
	I+R1OcafIqdLMZlDh1BaSmZChloVvP+t0diQ70TFq+n+YsHmU0KPfwYAe+ZxOfh+E/vYqkrTGJSee
	zecdaWGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRKa-00000002xc7-2KKy;
	Mon, 23 Nov 2026 10:31:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRKX-00000002xaq-3VQD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:31:27 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9147177;
	Mon, 23 Nov 2026 11:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795429728;
	bh=cMRfZSn1zOLQm5L80O6XfrH/7riZ1+RqoSDv1oE/c8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPaSgucvraqmS/cC71JC3Ei53cGHPN+HUyDvxXoWVy+QFFN/qnYfeBjmabPu3bOet
	 QMNcf4YJ1Tf276JlGoprDDcTe8bAObS/wlFYBZxJo3ZDn6BlYtdMiT552G5QnGEj0v
	 0JySljw1GwHG8kxpwwUWMPpol7frkG3tOtVWkbVo=
Date: Mon, 23 Nov 2026 12:31:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Paul Elder <paul.elder+renesas@ideasonboard.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
Message-ID: <20261123103118.GA2959742@killaraus.ideasonboard.com>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
 <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_023126_143483_726378FE 
X-CRM114-Status: GOOD (  21.25  )
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

On Fri, Nov 20, 2026 at 11:29:49AM +0100, Clément Le Goffic wrote:
> Hi Laurent,
> 
> Thanks for your feedback !
> 
> On 11/20/26 12:47 AM, Laurent Pinchart wrote:
> > As far as I understand, the assumption impacts the mdlc and cpg drivers
> > only, not their DT bindings. If (or rather, let's face it, when) a
> > firmware revision later breaks the assumption, we will be able to handle
> > it in those drivers without affecting DT.
> > 
> > I don't like this remapping driver much, in the sense that I wish it
> > wouldn't be needed, but it seems to me to be the best possible
> > compromise given the instability introduced by SCMI.
> 
> I don't think SCMI itself introduce instability.
> It only defines the protocol, and each firmware choose its ids.
> Could you tell me what you mean by instability?

That's nitpicking. The protocol is useless without an implementation,
and the protocol design leads to instability in the implementations.

> For development firmware, Geert's cover leaves it to vendor trees:
> 
> > This list deliberately ignores ID instability and the need for SCMI
> > quirks during development of the SCMI firmware.  While upstream Linux
> > must only support sufficiently mature firmware versions, vendor trees
> > (e.g. renesas-lts) may still want to support development firmware
> > versions.
> 
> For a resource that hangs the platform when Linux uses it, the SCMI server should deny Linux access to it.
> Until the firmware is fixed, a quirk can cover it.

-- 
Regards,

Laurent Pinchart

