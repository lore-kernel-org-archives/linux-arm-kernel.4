Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56001606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2AHweP+k;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IPLLgTIr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G3Ba0p/h751/9m3dnnXnltfXm//v4b2yBGW0yblY5kk=; b=2AHweP+krDyLA9
	3DiljIfP+8+VKakG5JFUw+tQ2N1AhYwicI4UV+WTD2zwE7xLg8yA4MTb2kv/BJBmoGrJclFda9vSv
	3HunXhGQMUHA/X+yEz8tOyNypMoJjpRO4OhLPRIIckEB1l2V6M+jQnrSLgUIAm9dZQhoBLfXU0A5I
	KIEvfEOoMiVcFKdbYaupZOPmlN4EEPuybfvrotmsn0MjH0+EMNmmk8+xXCnCrxjoxaT6CSU1kT4FL
	q6Hxxxmoi3o0WjXcUcTMVJbjfvO41yBugrLRBmZjmvUmUOYSGakOe94hqTkAMl3YJRNSqc/OjZm2w
	fURbhvcI5r+EzsqcrTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNUE-00000000VuT-0uJU;
	Mon, 09 Nov 2026 11:24:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNU6-00000000VqF-2fNh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:24:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23F2A1516;
	Mon,  9 Nov 2026 03:24:19 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A855A3F85F;
	Mon,  9 Nov 2026 03:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794223462; bh=JxhGBRgLcIwUFoRsO4Q7rZ/Z5w2PFVEbenlFpICHqXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IPLLgTIrbc1ltih/cqihkwzN7I5GATwEqDV4npsfe19gwNuW0ngAxnVPpDWwO0w2l
	 1kiTDPVcl/vqmYVpUu8MZkOlHvbYPotghjzRdBM9V+dJncb4HxjPryyWjn1NChuSCY
	 8J6MnRdFyQ87vzaM1vzEaztLf9+yYBvRDO2TUvP0=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	Chao Xu <xuchao066@163.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] coresight: funnel: inport schedule by priority can not take work
Date: Mon,  9 Nov 2026 11:23:56 +0000
Message-ID: <179422341587.3275439.15606482552305642928.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027151457.5713-1-xuchao066@163.com>
References: <20261027151457.5713-1-xuchao066@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_032422_719710_0F597C83 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 27 Oct 2026 23:14:56 +0800, Chao Xu wrote:
> The CoreSight SoC-600 TRM, section 10.11.2, PRIORITYCONTROL, a funnel
> rejects priority register writes whenever any port is enabled. The
> current sequence therefore prevent the configured priorities from
> taking effect. Write the priority register before enabling the
> first port.
> 
> 
> [...]

Applied, thanks!

[1/1] coresight: funnel: inport schedule by priority can not take work
      https://git.kernel.org/coresight/c/533e91f192eb

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

