Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F5606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O7cofm8a;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=HNxv2Zr3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qopof/KzEChronzbaNdRS8yRUwb7T04Bp6EAIGWAg3s=; b=O7cofm8ad8dza3
	keMEzHIPLRlpNLwiepuH+BPvGa1J0QTLVJFHyRKAZjO1vWepAsnsN3mm78Wq8nChoGlRScram+I0N
	3VTtNyEjit1YICAm6TVtDn77fn//pGf0aktWD8LN0YjrVrCLvTJAtPtw5ut6G+oIgYTd2ZwYQxt4w
	x9h6Rzj9nS/4mGsH9fMPorDYKzOKkgpglylYwTUcMgNmcovu0g5nmE5aydRTN7Yu8ifqA8ign8Srv
	78i8s9r7UBD3Abmgq1sWXlzh0L0hk+f7+hlauns/07VrkLEJUns2uzzAXBuaI2/1ARbx0LzOQON5S
	aGoCiWT4Qi3skc5Jo2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwjO-00000002cvf-3EML;
	Mon, 16 Nov 2026 13:26:47 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwjM-00000002cuP-1HRm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1794835602;
 bh=Qopof/KzEChronzbaNdRS8yRUwb7T04Bp6EAIGWAg3s=;
 b=HNxv2Zr3rBSQkaClIdIS1t510Vky5f7C0ZxVBeXQ499aVpv5isUVtraFMArElQOWgs9Di0AVa
 Fy8OuQ+N83w1K70F2NlWPHIvQUeDh/+Ag2pdFIFCihVyufWsa772NYE6w24ovAyW0A/tvrYPDrA
 LMyBqPC4jweDI84VioeDK8nt2lkHa5SFxucqJQ/CRYaP5O+cjCqf53gQiX69LKadriCoz9gQbDf
 KBBiv3KhXNRCj6GU9x0uz4uFCOltPeqwqpQ0h8Gp1fONJIcxQ31xufH61117b1JKuu8OmYqnRs4
 zCjS9iC+pj8OqI7qdQcfl5GZ9BYNLeKsAQPYxYUl1OnQ==
X-Forward-Email-ID: 6afb048fb9d3ade89ee12d0f
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.26
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 16 Nov 2026 08:26:37 -0500
Message-Id: <DMWO4APJSZPS.16AA1EABR1AEJ@ubuntu.com>
Cc: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Sven Peter"
 <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal Gompa"
 <neal@gompa.dev>, "Marc Zyngier" <maz@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, "Yuvan Shen" <yuvanshen09@gmail.com>, "Nick Chan"
 <towinchenmi@gmail.com>
Subject: Re: [PATCH 00/13] drivers/perf: apple_m1: Add M3/M4/A18 Pro Support
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Myria Sarvay" <myrialsarvay@gmail.com>, "Joshua Peisach"
 <jpeisach@ubuntu.com>
X-Mailer: aerc 0.21.0
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
 <DMQ0CENBZQGW.L35BD1BXYE9Z@ubuntu.com>
 <CAFTKyQziVo3COsPZSSZOaFs7R6HhXEWNHYfgTkjyACc7bkoBDw@mail.gmail.com>
In-Reply-To: <CAFTKyQziVo3COsPZSSZOaFs7R6HhXEWNHYfgTkjyACc7bkoBDw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_052644_659889_3AF19C90 
X-CRM114-Status: GOOD (  20.87  )
X-Spam-Score: -2.0 (--)
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

On Fri Nov 13, 2026 at 2:25 AM EST, Myria Sarvay wrote:
> On Sun, Nov 08, 2026 at 12:32:46PM -0500, Joshua Peisach wrote:
>> On Tue Nov 3, 2026 at 5:14 AM EST, Myria Sarvay via B4 Relay wrote:
>> > This series adds support for the CPU PMU in the new M3, M4 and A18 SoC=
s
>> > presed in apple devices. These PMUs have new encodings for events, alo=
ng
>> > with larger codes for these events. All of these events are as Apple
>> > describes them in the various kpep files found under /usr/share/kpep o=
n
>> > macOS 27. More events may exist, but we have no idea of their affinity=
,
>> > or what they actually count, so we don't include them here.
>> >
>> > These patches have been tested on my own M2 (t8133-j413) and M3
>> > (t6031-j514c) devices, as well as by Yuvan on their M4 (t8132-j713)
>> > device.
>> >
>> > If possible, the device tree changes should probably go through
>> > apple-soc, as this is where the recently picked up M4 Pro/Max dts are.
>> >
>> > Tested-by: Yuvan Shen <yuvanshen09@gmail.com> # on t8132-j713
>> > Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
>> > ---
>> > Myria Sarvay (12):
>> >       dt-bindings: arm: pmu: Add Apple M3/M4/A18 Pro SoC CPU PMU
> compatibles
>> >       drivers/perf: apple_m1: Remove unused variables
>> >       drivers/perf: apple_m1: Support per-implementation event size
>> >       drivers/perf: apple_m1: Use macros for per-implementation init
> functions
>> >       drivers/perf: apple_m1: Add Apple M3 Series Support
>> >       drivers/perf: apple_m1: Add Apple M4 Series Support
>> >       drivers/perf: apple_m1: Add Apple A18 Support
>> >       arm64: dts: apple: t603x: Add PMU Device Nodes
>> >       arm64: dts: apple: t8122: Add PMU Device Nodes
>> >       arm64: dts: apple: t604x: Add PMU Device Nodes
>> >       arm64: dts: apple: t8132: Add PMU Device Nodes
>> >       arm64: dts: apple: t8140: Add PMU Device Nodes
>> >
>> Maybe the folder should be renamed to 'apple_arm' or something like
>> that?
>>
> What do you mean by this? What folder are you referring too? If you mean
> the device tree's, they're already under the arm64 folder, so apple_arm
> seems redundant. If you mean the CPU PMU name, I get that, but I'm not
> sure how to change that, given it's already hard coded with the config
> option `APPLE_M1_CPU_PMU`. I feel like changing its name at this point
> would cause backwards compatibility issues around kernel
> configs/blacklists if people use them.

Sorry, brain fart. I meant the file apple_m1, to consider splitting
it up into multiple files. It's no big deal though :)

-Josh

