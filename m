Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387CD606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SFsYnqnP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rf79iAr+;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NE2fevFM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9B8mLJKAa78eticVDQeqdgbhsOyYRLPHh3wbiZWj8Qw=; b=SFsYnqnPxBVtQd
	4xD9MC1zBrCMl+huNm4NpxnvPoK3VjgVTjGx55VhOEIO8baUp/8/30c3IPE4isFO7fPXDCK482Uv3
	tMw2uuZsjgXwN019j9ZUSsE3vYxB7ac/NWPqfV6GtYf3L7IEDfywE4yERtHaUDgZEqpY2qIVS9OxQ
	e1X6f+C6QqtbM4og83N0HaaFBPTHtfpV984gN1ZK6TojMtLw3LSGp5o7tPbREbQDL+uP4E9sGT+7s
	d4cfpq2daQIbujmQ86TLgcWrlMXGNpyTjmahbWFtJ1eOfyUSI/8iSQf1mc1kf/xLd7D/2YcMT1Qke
	SyEHlhW2Z3msnVD5kohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWsn-00000001lYs-2Sau;
	Mon, 09 Nov 2026 21:26:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWsk-00000001lWu-3nMI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 21:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9B8mLJKAa78eticVDQeqdgbhsOyYRLPHh3wbiZWj8Qw=; b=rf79iAr+8ruCqQw9A7lzhpJoaQ
	Ed663iZfrfpewhxVIjD/GSKlMei5EqJoFj2my9QEUVyQ0h2IytYzEo7+JU2AcfJ83AfawfclDiMnQ
	FxqLe+WAnKlspJGZAgrW+MqfKvYyItg2K9KhmgaT+CKLExElp6rjZ5yu+Hba3e7QCHs1U1EZ5mNag
	LyWLkLBz00Bl+Fgh5jG/pEoSbkJ0VWTe9ttEdRijWGDkve3eHPt0KIslRaeMOC0qFRIxOS2c5crv6
	qNtaDc/iQT/PKIXWsIVl3Ur10g624Do1flxDnubDceUAVO7nMuDTJ3rkAj23xTYXnbI0CuIuTfNZ5
	XNMhVL6A==;
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWsX-00000007DW6-2iAN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 21:26:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1qGBui8JDShArC8ewmsXR2/aVLCDIqiWDsD95QnDRYAHKRwRLApxd/bgVDgqc/PnxjF8IwwWa41VY05inaLVA7rmD9ZlhJyP0S97CeeEKVORAaxDvZO1shpUkB2rFEVoYul/aXIDKy++eE9wDkWzU6SLOVAOoZ9049flsKTO2qaPbdI6waAlTsEVB2a7yLd3P/EUzCQMVn5KbkN1TjbgOqIvRKojddLmlcW25Oo6bwcsCFWP1D9xBns7zCpY2tvVmPJURfSk0+FAG4N8CaZFQlB8f+EViAj/as6+QySj/Uk93B6zSnivin72snBYRdSsx95WJTRHsxjOGCM9cB2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9B8mLJKAa78eticVDQeqdgbhsOyYRLPHh3wbiZWj8Qw=;
 b=YOjNbTB/xfai+5jP6x+Qn/zTqTmc2CJjvXrAjLPAE7hMtirFVLVGMUb8fXcWOSYEqhGRaFiq9GmowREuSp2wEaAzDmtnxzsoTajuTx755BGOQxwwAdjMjptPrdHnLlkSunIODU+f7Ht7iKPyeFQG8iJ0X4kFPvoOG1BeBB5KQMRCrvGJ0lRhUjkNg/QiPl+tT4AML/+bq8QgqI9sCcpB5XXO6J8zzN2vlviMyxWKlxNnC+eVjzEUwtPdhAG3SODXYucLSG6w+EoLDel5Vx1ageQgN28vLRuN6XyhtsD3M2ZswO8tdTKCiU/+lIpOuerLutj06cgA39Izrmj194LOfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B8mLJKAa78eticVDQeqdgbhsOyYRLPHh3wbiZWj8Qw=;
 b=NE2fevFM1S+faop21hfBl57Q53Uei0I1IyxmD+gw+fV/6GitQMhEoTNx63LGNHSZX/529LwFDeRcnUpskj+rTQetrWuEysZiNy5ctTQeChjauBaVPx0MqalMBEF2r1V7/BpD+MwMMFFsRfoMBY9EAj5QxK/fA6W4/C/IcCE9oGjjvQGpSaE3+neuKprbulIiWxtCR+8fzZX+pVSO7OhRF8m3Nq2UBYzxMPwWCZ0if4Muu+47nvMDJNS1evflMTdbkzbVtxX2Tt/5p5kGAZB+uXA+fN1PdQMGTYiCDXhFI30N/Dfk5qEpNmReRjGaqXko5bKEERH5PzW0V31UxemUTQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SA1PR12MB6800.namprd12.prod.outlook.com (2603:10b6:806:25c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 21:24:51 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:51 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v3 15/15] arm_mpam: Add KUnit test for CPU-less NUMA node affinity
Date: Mon,  9 Nov 2026 13:24:27 -0800
Message-ID: <20261109212427.1409204-16-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::18) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SA1PR12MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b3f51e-f1be-405a-b30e-08df3ea7e3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|921020|261009223027099003|11063799006|261021121427099003|261022105027099003|261026140227099003|56012099006|261028144727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qiIi7D2hyYkVT+7xu+7DwGcblWuht8v+SsQbua7v5dVTLaYO/DosoXeJB7w536/jYpcx4dxBL8//AOsO+gkJkvsO/alCpNnBFjvA6Xma0qurhqe7x0WSPj5ietlf7jFSrXbHS8L9juMju6jL+qRS6p7MdvU9GctoX10a0c4CwIpLEgZq0/QP/RfsafnYaUm+MBaLad8Ud9WEKMix+7iKGWj75Fu1v5n1tsLQKDpDyEnMYsz6IROSdiSltA8TDiuqycoXpYUE5tPw+HIQw9+Mksqych68EJZcjbXTtwIFDTi6ZvjYbvytlM623KbWBm3Sviz7i/5C0TfMOsah3k3bsqA1bcwx8LxIjNAZ/62m8SRiZZ7SrHxvAZZzjCz5/yFt8WX9zj4j2cvTK2H5mwcCRNdDm8FfAkjFuP7emh43r2e7PgxJddZ4nzOqlTtiTHr9d6FuhDmauywXjpUaCNgtDvkoubFdBy83GKnAvPadOH8qnA6+NTuGROnOf61md3iDoXRD8wevpum462nSnIVt2Iy21CMBqF5OIgMfcMAeQVlYVW5XQNg8DNROf5GSwH8qQzzAreloiHf36/C9ZSjZLVsZU8wfBH5ErltEPNA2mPisngVum2OdpXfs9hQ/DJnlH8YDN7X6FrkKHzBJ/pBP3Y8eCE/oij0egLOko+E6etN5LnedTzeS9a61XvAMdRhXexgeQVLH4AS2DGaPQGvR+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(261009223027099003)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(56012099006)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ehGhnp1Nqk1aDGzAdK5NrniUy7/c9Xz9weRE7se96xEbZkyzkO0YuGZYuHWQ?=
 =?us-ascii?Q?UzwhRz0sA96sj6YWH3p18w5XfU7LFxem5P0KYr9NNBqLDaU80UooQzmmwFAo?=
 =?us-ascii?Q?TLIE4IvtsvwZzIuWly1qTqy+rUDGZU+7xywScG5RZaLCo1hbkMFmgeZ5jAtD?=
 =?us-ascii?Q?GuTxjPGsz5JMr1swL0+K4evBDuKKBFNKDlf32/14cBW0dKt+W5B7sWs/6lH2?=
 =?us-ascii?Q?CUElClv/QJC9RPoUkMG3dB6HrS6EQgdvSTB/WtfgdX+copJpNFBdwrrnrmic?=
 =?us-ascii?Q?QTa/yJSSniObtBa8hIqbuB0Dcl1U86jGfwQ8wnuOp9lBRwC1GzV1WUCByYif?=
 =?us-ascii?Q?lBJmKUNuSbaYvuYbodyytTfMjRhbTdks9TfqnBzrkvIVmC9UVqUoC8o1/v+Z?=
 =?us-ascii?Q?PLuOznacL8HY1o9AQbMIddKzXXZ80vb4bbRg/n77kZaCeFYBZkCRlqZNuHiZ?=
 =?us-ascii?Q?nJ4Zg2ouxZgIoCa2eSJ0iGKUXwHRNvc9DX0YTthoDY62hHqbH1Qk4oT6+79c?=
 =?us-ascii?Q?io0CKob49WhccZlHY3qEbWJt8clGsr8Rg3zGkVnLW+XLgFoSDP0WBOWuQoLg?=
 =?us-ascii?Q?4Dt0wVyElCr/mxgw9ynnVWynlcYaO6VLgZ+PrKjYyuE5ynSnxrzPIaNFTmD0?=
 =?us-ascii?Q?/E3hiFIOhTvJYqZD+IbNfGEx0pS4mQeErtEqanV6F/8zDdO7VEHqYdR4jijO?=
 =?us-ascii?Q?wbeBVd2thYBECs4jgRSccxyeY1HVse7iKvui/c9gOoL+xZNj2ynNqRfOf+Zl?=
 =?us-ascii?Q?t67JQmPU8pzWol1dCoQ4z9e/Tw4dg1KuEGcrukahqiiQ30PnWImdaN3pZHOa?=
 =?us-ascii?Q?DB5ML8Y5gdn7umgUwjHhheeIHjJh1dWpu9jFO4LCW2SkfFsmieZr2hnyariJ?=
 =?us-ascii?Q?I9JCcneeMvTHPgZIVW/HOUNUqs/QWzo7NXLV0QzfITxPLSYHa5Kj6mNfIUZv?=
 =?us-ascii?Q?OG9EJjBzI13esJ0n0EvBxZ8h25sZ6HUZuQPCpAcCfn6lL0iTUnhzJdhRsd/V?=
 =?us-ascii?Q?nuzkKknHynMfmZdqv7I93hWDrRQP8P9rAvaLLMLQipKtmIXlxktrxkklyXUA?=
 =?us-ascii?Q?MOXdigZgmue7ktD+ijMstQjNqXs+iLSo08+NvdEQmlfBlgEiOk3JpZS6l4XX?=
 =?us-ascii?Q?LwbJv42SRHqYtlCJn+afE3dvEg9hEY/kt73guCggxkqi/YbCZuzFjH0TYDVV?=
 =?us-ascii?Q?NWQ+zZZIUYLH5j5YXqcKECwEWVuQMp7poQV6Nd2FQ3eic2ywlYoPp7plSIAR?=
 =?us-ascii?Q?SjIlWBDyA+2BrwDOO0SmRUc6xXAWepZkgD9o4zXa1o+1g0s+qUeIRtU6ZZdk?=
 =?us-ascii?Q?I2B5mcYdrXk60wLeltS9XlR1rtDjevtsBmZ2DobpVuY1wLrye7Nq4l2RhwQc?=
 =?us-ascii?Q?RvgsGNQVR2aazZTN0SMQUOSgmVTsOfx5RCkBFM8efcp0vXsJYk0DDCc5hSV8?=
 =?us-ascii?Q?7VGsibu7D9X6y3ZpCyNb85aNXL2joQ7yV84HFHpCOCXNJTAgNy2NLS2wrBH3?=
 =?us-ascii?Q?7AGm5YlVMQLRhbjbaQZheR/FWHTjFmcyWecSFLd1tz37GCUCAzCibNiHwzvt?=
 =?us-ascii?Q?C7bpWjUcLSZU9TouWjDk+Hqc7Z3gpAFsRFhTiGV99DPL2WkS+E6ppnR1GCu9?=
 =?us-ascii?Q?zwW/Ro/Y2zSwogRdsg67dBxOCmlRUdiJvBuya+0hlLKlUAP5Ec7KhJezVzKr?=
 =?us-ascii?Q?wff0jtB1+4+ikL6TjQev7NgKbf0W4rz6iLWNXIfHBUhZN49XcRPlVRk7iKIx?=
 =?us-ascii?Q?cZOePr+j0A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b3f51e-f1be-405a-b30e-08df3ea7e3b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:51.2645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGYRBZzfowfGLJLUHMGmq5eCEjxi7nPCdz6afv9s4TeRxzNbG6ycL5xczteuhL3ClCnzD+kOgOu+uF9Ih6RHRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_212614_477365_1EE490E2 
X-CRM114-Status: GOOD (  13.00  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Memory MPAM MSCs on CPU-less NUMA nodes rely on mpam_ris_get_affinity()
falling back to cpu_possible_mask so the RIS can participate in MPAM
and resctrl control. Add a KUnit test that locates a CPU-less node when
present, exercises the MPAM_CLASS_MEMORY path, checks the reported
affinity equals cpu_possible_mask intersected with MSC accessibility,
and verifies cpu_less is set when the borrowed affinity is used.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/test_mpam_devices.c | 67 +++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
index 31871f519729..7054919d4574 100644
--- a/drivers/resctrl/test_mpam_devices.c
+++ b/drivers/resctrl/test_mpam_devices.c
@@ -382,9 +382,76 @@ static void test_mpam_reset_msc_bitmap(struct kunit *test)
 	mutex_unlock(&fake_msc.part_sel_lock);
 }
 
+static u32 find_cpuless_numa_node(void)
+{
+	int node;
+	cpumask_var_t tmp;
+
+	if (!alloc_cpumask_var(&tmp, GFP_KERNEL))
+		return UINT_MAX;
+
+	for (node = 0; node < nr_node_ids; node++) {
+		cpumask_clear(tmp);
+		get_cpumask_from_node_id(node, tmp);
+		if (cpumask_empty(tmp)) {
+			u32 ret = node;
+
+			free_cpumask_var(tmp);
+			return ret;
+		}
+	}
+
+	free_cpumask_var(tmp);
+	return UINT_MAX;
+}
+
+static void test_mpam_ris_cpuless_numa_affinity(struct kunit *test)
+{
+	cpumask_var_t affinity, expected;
+	bool cpu_less = false;
+	u32 node;
+	int err;
+
+	node = find_cpuless_numa_node();
+	if (node == UINT_MAX) {
+		kunit_skip(test, "No CPU-less NUMA node on this platform");
+		return;
+	}
+
+	if (!alloc_cpumask_var(&affinity, GFP_KERNEL) ||
+	    !alloc_cpumask_var(&expected, GFP_KERNEL)) {
+		free_cpumask_var(affinity);
+		free_cpumask_var(expected);
+		kunit_skip(test, "Failed to allocate cpumask");
+		return;
+	}
+
+	memset(&fake_msc1, 0, sizeof(fake_msc1));
+	fake_msc1.pdev = &fake_pdev;
+	cpumask_copy(&fake_msc1.accessibility, cpu_possible_mask);
+
+	fake_class.level = 3;
+	fake_class.type = MPAM_CLASS_MEMORY;
+	fake_comp1.comp_id = node;
+
+	cpumask_clear(affinity);
+	err = mpam_ris_get_affinity(&fake_msc1, affinity, MPAM_CLASS_MEMORY,
+				    &fake_class, &fake_comp1, &cpu_less);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_TRUE(test, cpu_less);
+
+	cpumask_copy(expected, cpu_possible_mask);
+	cpumask_and(expected, expected, &fake_msc1.accessibility);
+	KUNIT_EXPECT_TRUE(test, cpumask_equal(affinity, expected));
+
+	free_cpumask_var(affinity);
+	free_cpumask_var(expected);
+}
+
 static struct kunit_case mpam_devices_test_cases[] = {
 	KUNIT_CASE(test_mpam_reset_msc_bitmap),
 	KUNIT_CASE(test_mpam_enable_merge_features),
+	KUNIT_CASE(test_mpam_ris_cpuless_numa_affinity),
 	KUNIT_CASE(test__props_mismatch),
 	{}
 };
-- 
2.53.0


