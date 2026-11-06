Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830B3606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZCNp5rVc;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQQVZ2lY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CqdwfM5CSlFvy5/OhILqWGW0aw+xBkJteTQDyeaLuTo=; b=ZCNp5rVc65lus5zbqqZkLz1Q88
	SZqzRPYgtY2QiB2AFlDRmnOBmOT0l2VXRMmzysuDv8NaWWJ3WP4IHBb7DAd+OxrOI4u3VXcccHJti
	3fzRP2/uGfrBRepYYNQP8PV3vSAIvcP4OHqE4gvtc+//WNUC3gRc3Qjo6HcrBTmeq7J6OVSpNHahP
	zrkJ1Z6VEta3Ua9ib8/1OCNHuJuzw8bmCJbD2qQu34b3sEXQ3VgGxXAMRnjfwuwcaT6/gQwFjaizV
	eZ+qmlEHDyhRRRdotfkNyu5oILbIslf7uU4/+RDLiqon/NqI65w0xTOrO4mTV7a+PvNvl8tcmhoHk
	C2sNE6Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRVI-0000000Dhuu-2ltf;
	Fri, 06 Nov 2026 21:29:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRVH-0000000Dhtf-2Mjt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:29:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E5EEF601F8;
	Fri,  6 Nov 2026 21:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D0D1F0089F;
	Fri,  6 Nov 2026 21:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794000582;
	bh=CqdwfM5CSlFvy5/OhILqWGW0aw+xBkJteTQDyeaLuTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fQQVZ2lYiYZlDEu10qX9/c4r1gv2Fx38R3aKVCKS3cq2j8lzuGUVGcpdjaZLpqUjh
	 FUUhtYmCqq3PotRU+CnYhHnKpgHw1i/YAIZTBjId7ge4sEczylffu9L7Awjz2aA51V
	 BboQUsiAICQQm/sLcKwIvstXgJKL1yTf610E/sAOjW+Lb1wa44Bq7Keav+lZSh7toF
	 EfDDMQYbKYpCwgIvRIt+I3egt9sLyNoUz8oYc6FrYF9C1CRyP9w3xGSUnSDXED4v+j
	 tX4tPilIQvgoU9A3tDYwZGLpDvQu69saj8gsRUYbopCwx9co9zq/hCxs1rji1ejRUl
	 e7QekGDYLdtqw==
Date: Fri, 6 Nov 2026 15:29:39 -0600
From: Rob Herring <robh@kernel.org>
To: Reza Kurniawan <imkyufie@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Alejandro Tafalla <atafalla@dnyon.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add
 skip-suspend-mode-switch property
Message-ID: <20261106212939.GA1814035-robh@kernel.org>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
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

On Thu, Oct 22, 2026 at 09:41:10AM +0000, Reza Kurniawan wrote:
> From: Alejandro Tafalla <atafalla@dnyon.com>
> 
> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> call is rejected with NOT_SUPPORTED.

Is that call fatal? Why can't you just try the call and if it fails, 
avoid it. Then you don't require a DTB change to fix the issue.

Rob

