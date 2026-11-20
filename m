Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65C8606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aSAF8DFH;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=WH/z1X8C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bOtRn9pWlnVKBkrN+sQPsmyroCxtIQHYzIEKtafqJws=; b=aSAF8DFHc2ZM8s
	ufeDCV8MLykMu8WK5QyNw94bLmAwufrr1xZrJ8wz1lrTNf1re9IN7WLME9CMkYtlC4NvOgUt2m2jr
	qZP/tL+uYPGBDF0XkbQVvw1wgU5e8WMp24cC9D633+a1mcQ2vuxDOWSXg7H3GNAgERAg3TcJPZFjb
	GhHFLV8RXE+tJVD5N204tP0pLzzkDxCPLmz9748Xz+OAsQE/l+bNE68O0h1rrstwlU4HtFwI/BmvY
	FhVEznPkSSXc/tFR5itHBeq6iaJZQFbgSXbJBzgPgXui/DO7/+x0s1zOkn5lBx92TfWe4i/kzNX+6
	Xf94ew/zE+vPn5tFMJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHBD-0000000E4Gg-3IKH;
	Fri, 20 Nov 2026 05:29:03 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHAs-0000000E4CF-1PQU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:28:40 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jW3ll3FCTzMlwH;
	Fri, 20 Nov 2026 06:28:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795152515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bOtRn9pWlnVKBkrN+sQPsmyroCxtIQHYzIEKtafqJws=;
	b=WH/z1X8CpIYz8PCoai5azWInGByNIzM2UuSLsj8C5ZVqvfKVerpdcJ84NMZpxbHlnEYZnL
	mQXl6pJoja9kAU83PW/W7VmgiKDqf6FfWiJbmOQKhQ4dqY5XKSllXo72waOMj9lo1Pa0QU
	JXNahzkOwNAysxkzg3RWz0H2pgJXtKgDDyjj5ZctbjoIDPDs4yPiYhZZmRMIg6Sf0p4tUv
	BhsmkJ1LH6rghJH0he5WB39fFjp42mSdyYT3TSZRXBzHN2GlDQfALOE+uRb6eGZCFZMNpT
	LAMggAb3zHxEaqyjfsUOxea59OYMhLizVriJjyW/z2GWbqNJxagTZltyCJNIdQ==
Message-ID: <1bb22478-6ed8-432b-bfe7-efb29b5f091e@mailbox.org>
Date: Fri, 20 Nov 2026 04:37:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/15] pmdomain: renesas: r8a78000: Shrink IDs to 16
 bits
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
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
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <72f8eae23faefaa169cff7a52cdbafce2cd50e1f.1795029012.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <72f8eae23faefaa169cff7a52cdbafce2cd50e1f.1795029012.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 7aef4dacef87d464d56
X-MBO-RS-META: 3nc4ods5k8jsq9wxn16ge3piqdifkp9y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_212838_571658_F4D97294 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 8:45 PM, Geert Uytterhoeven wrote:
> Reduce table size by shrinking hardware module IDs from 32 to 16 bits,
> which is still plenty.
> 
> While at it, use u32 to store of_phandle_args.args[1] in
> r8a78000_mdlc_attach_dev().

This could possibly be a separate patch, but let's not inflate the 
series further.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

